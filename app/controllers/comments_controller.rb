# frozen_string_literal: true

class CommentsController < ApplicationController
  def create
    @comment = @commentable.comments.new(comment_params)
    @comment.user = current_user
    if @comment.save
      flash[:notice] = 'コメントを作成しました'
    else
      flash[:alert] = 'コメントを作成できませんでした'
    end
    redirect_to @commentable
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
