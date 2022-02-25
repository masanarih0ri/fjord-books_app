# frozen_string_literal: true

class CommentsController < ApplicationController
  def create
    @comment = @commentable.comments.new(comment_params)
    @comment.user = current_user
    if @comment.save!
      flash[:notice] = 'コメントを作成しました'
      redirect_to @commentable
    end
  rescue ActiveRecord::RecordInvalid => e
    flash[:alert] = e.record.errors.full_messages
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
