class BloggersController < ApplicationController

    def index
        @bloggers = Blogger.all
    end

    def show
        @blogger = Blogger.find(params[:id])
        @sum = 0
        @blogger.posts.each do |post|
            @sum += post.likes
        end
        @most_likes = @blogger.posts.max_by do |post|
            post.likes
        end
    end

    def new
        @blogger = Blogger.new
    end

    def create
        @blogger = Blogger.new(blogger_params)
        if @blogger.save
            redirect_to blogger_path(@blogger)
        else
            render :new
        end
    end

    private

    def blogger_params
        params.require(:blogger).permit(:name, :age, :bio)
    end

end
