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
      if @comment.commentable_type == 'Book'
        @book = Book.find(params[:book_id])
        render 'books/show'
      elsif @comment.commentable_type == 'Report'
        @report = Report.find(params[:report_id])
        render 'reports/show'
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
