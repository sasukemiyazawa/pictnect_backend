class Api::V1::PostsController < ApplicationController
    include Common
    
    def index
        @posts = Post.all
        render json: {data: @posts}, status: :ok, methods: [:images_url]
    end

    def show
        @post = Post.find(params[:id])
        tags = @post.tags.map(&:tagname)
        render json: {data: @post, tags: tags}, status: :ok, methods: [:images_url]
    end

    def create
        @post = Post.new(post_params)
        @post.likeCounts = 0
        @post.pickup = false
        if @post.save
            setTag(@post, params[:tags])
            tags = @post.tags.map(&:tagname)
            render json: {data: @post, tags: tags}, status: :ok, methods: [:images_url]
        else
            render json: {data: @post.errors}, status: :internal_server_error, methods: [:images_url]
        end
    end

    def update
    end

    #いいね機能
    def like
        @post = Post.find(params[:post_id])
        @post.likeCounts = @post.likeCounts + 1
        if @post.save
            render json: {data: @post}, status: :ok, methods: [:images_url]
        else
            render json: {data: @post.errors}, status: :internal_server_error, methods: [:images_url]
        end
    end

    def pickup
        @post = Post.find(params[:post_id])
        @post.pickup = true
        if @post.save
            render json: {data: @post}, status: :ok, methods: [:images_url]
        else
            render json: {data: @post.errors}, status: :internal_server_error, methods: [:images_url]
        end
    end

    def destroy
        @post = Post.find(params[:id])
        if @post.destroy
            render json: {data: @post}, status: :ok
        else
            render json: {data: @post.errors}, status: :internal_server_error
        end
    end

    private
        def post_params
            params.permit(:nickname,:titles,:comments,:images, :tags)
        end
end
