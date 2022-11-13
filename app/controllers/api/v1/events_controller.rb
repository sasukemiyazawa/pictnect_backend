class Api::V1::EventsController < ApplicationController
    def index
        @events = Event.all
        render json: {data: @events}, status: :ok, methods: [:image_url]
    end

    def show
        @event = Event.find(params[:id])
        tags = @event.tags.map(&:tagname).join(",")
        render json: {data: @event, tags: tags}, status: :ok, methods: [:image_url]
    end

    def create
        @event = Event.new(event_params)
        tags = params[:tags].split(",")
        if @event.save
            tags.each do |tag|
                @event_tag = Tag.find_or_create_by(tagname: tag)
                @event.tags << @event_tag
            end
            render json: {data: @event}, status: :ok, methods: [:image_url]
        else
            render json: {data: @event.errors}, status: :internal_server_error, methods: [:image_url]
        end
    end

    def update
        @event = Event.find(params[:id])
        if @event.update(event_params)
            render json: {data: @event}, status: :ok, methods: [:image_url]
        else
            render json: {data: @event.errors}, status: :internal_server_error, methods: [:image_url]
        end
    end

    def destroy
        @event = Event.find(params[:id])
        if @event.destroy
            render json: {data: @event}, status: :ok
        else
            render json: {data: @event.errors}, status: :internal_server_error
        end
    end

    private
        def event_params
            @tmp = ActionController::Parameters.new(
                eventname: params[:eventname],
                contents: params[:contents],
                term: Date.today + params[:term].to_i,
                image: params[:image],
                tagname: params[:tagname]
            )
            @tmp.permit(:eventname,:contents,:term,:image)
        end
end
