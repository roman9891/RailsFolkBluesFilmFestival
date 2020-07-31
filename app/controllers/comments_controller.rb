class CommentsController < ApplicationController
    before_action :authorized, only: [:create]
    before_action :admin_authorized, only: [:destroy]

    def index
        @comments = Comment.all
    end

    def showing_index
        @showing = Showing.find_by(id: params[:id])
        @comments = Comment.all.select do |comment|
            comment.showing == @showing
        end
    end

    def create
        @comment = Comment.create(comment_params)
        
    end

    def destroy
        @comment = Comment.find(params[:id])
        @comment.destroy
        redirect_to showing_comments_path
    end

    private

    def comment_params
        params.require(:comment).permit(:comment_text, :showing_id, :user_id)
    end
end
