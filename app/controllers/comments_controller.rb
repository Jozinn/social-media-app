class CommentsController < ApplicationController
    def index
        @post = Post.find(params[:id])
        @comments = Comment.where(post_id: @post.id)
    end

    def create
        @Comment.new(comment_params)
        if @Comment.save
            redirect_to posts_path
        else
            render :index, status: :unprocessable_entity
        end
    end

    private
    def comment_params
        params.require(:comment).permit!
    end
end
