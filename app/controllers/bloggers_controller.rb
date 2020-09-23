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

    end

    def create

    end

end
