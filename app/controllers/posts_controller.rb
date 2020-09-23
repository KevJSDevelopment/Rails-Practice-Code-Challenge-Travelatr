class PostsController < ApplicationController
    
    def index
        @posts = Post.all
    end

    def show
        find_post
    end

    def new
        @post = Post.new
    end

    def create
        @post = Post.new(post_params)
        if @post.save
            redirect_to post_path(@post.id)
        else
            render :new
        end
    end

    def edit
        find_post
    end

    def update
        find_post
        if @post.update(post_params)
            redirect_to post_path(@post.id)
        else
            render :edit
        end
    end

    def add_like
        find_post
        if @post.likes == nil
            @post.update(likes: 0)
        end
        @post.update(likes: @post.likes += 1)
        redirect_to post_path(@post.id)
    end

    private 

    def post_params
        params.require(:post).permit(:title, :content, :blogger_id, :destination_id)
    end

    def find_post
        @post = Post.find(params[:id])
    end

end
