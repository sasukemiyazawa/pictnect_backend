class Api::V1::EventsController < ApplicationController
    def index
        @events = Event.all
        render json: {data: @events}, status: :ok, methods: [:image_url]
    end

    def show
        @event = Event.find(params[:id])
        render json: {data: @event}, status: :ok, methods: [:image_url]
    end

    def create
        @event = Event.new(event_params)
        if @event.save
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
            params.require(:event).permit(:eventname,:contents,:term,:image)
        end
end
