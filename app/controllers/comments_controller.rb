# frozen_string_literal: true

class CommentsController < ApplicationController
  def create
    @comment = @commentable.comments.new(comment_params)
    @comment.user = current_user
    if @comment.save
      flash[:notice] = t('.notice')
      redirect_to @commentable
    else
      flash[:alert] = t('.alert')
      render @comment_path
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
