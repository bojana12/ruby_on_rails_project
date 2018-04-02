class CommentsController < ApplicationController
  before_action :require_login, except: [:create]

  def create
    @comment = Comment.new(comment_params)
    @comment.article_id = params[:article_id]

    if @comment.save
      flash[:success] = "You have successfully post a comment!"
    else
      flash[:error] = "Enter your name and comment before click on submit button!"
    end

     redirect_to article_path(@comment.article)
  end

  def comment_params
    params.require(:comment).permit(:author_name, :body)
  end
end
