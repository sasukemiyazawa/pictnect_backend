class Api::V1::EventsController < ApplicationController
    include Common

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
        if @event.save
            setTag(@event, params[:tags])
            tags = @event.tags.map(&:tagname)
            render json: {data: @event, tags: tags}, status: :ok, methods: [:image_url]
        else
            render json: {data: @event.errors}, status: :internal_server_error, methods: [:image_url]
        end
    end

    def update
        @event = Event.find(params[:id])
        if @event.update(event_params)
            setTag(@event, params[:tags])
            tags = @event.tags.map(&:tagname)
            render json: {data: @event, tags: tags}, status: :ok, methods: [:image_url]
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
            params.permit(:eventname, :contents, :term, :image, :tags)
        end
end
