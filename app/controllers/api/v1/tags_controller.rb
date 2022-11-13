class Api::V1::TagsController < ApplicationController
    def index
        @tags = Tag.all
        render json: {data: @tags}, status: :ok
    end

    def show
        @tag = Tag.find(params[:id])
        render json: {data: @tag}, status: :ok
    end

    def create
        @tag = Tag.new(tag_params)
        if @tag.save
            render json: {data: @tag}, status: :ok
        else
            render json: {data: @tag.errors}, status: :internal_server_error
        end
    end

    def update
        @tag = Tag.find(params[:id])
        if @tag.update(tag_params)
            render json: {data: @tag}, status: :ok
        else
            render json: {data: @tag.errors}, status: :internal_server_error
        end
    end

    def destroy
        @tag = Tag.find(params[:id])
        if @tag.destroy
            render json: {data: @tag}, status: :ok
        else
            render json: {data: @tag.errors}, status: :internal_server_error
        end
    end

    private
        def tag_params
            params.permit(:tagname)
        end
end
