class CommentsController < ApplicationController
    # resources :comments, only: [:index, :create, :destroy]
    
    def index
        @comments = Comment.all
    end

    def create
        @comment = Comment.create(comment_params)
        
    end

    def destroy
        @comment = Comment.find(params[:id])
        @comment.destroy
        redirect_to comments_path
    end

    private

    def comment_params
        params.require(:comment).permit(:comment_text, :showing_id, :user_id)
    end
end
