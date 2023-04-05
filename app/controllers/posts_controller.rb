class PostsController < ApplicationController
    def index
        @posts = Post.all
    end

    def show
        @post = Post.find(params[:id])
    end

    def new
        @post = Post.new
    end

    def create
        @post = Post.new(post_params)
        if @post.save
            redirect_to posts_path
        else
            render :new, status: :unprocessable_entity
        end
    end

    def like
        @user = current_user
        @like = Like.where(user_id: current_user.id).where(post_id: params[:id])
        unless @like
            Like.create(user_id: current_user.id, post_id: params[:id])
            redirect_back(fallback_location: root_path)
        end
    end

    private
    def post_params
        params.require(:post).permit!
    end
end