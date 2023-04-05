class HomeController < ApplicationController
    def index
        @friends = Friend.first(10)
        @posts = Post.first(50)
        @comment = Comment.new
    end
end
