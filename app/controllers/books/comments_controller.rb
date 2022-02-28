# frozen_string_literal: true

class Books::CommentsController < CommentsController
  before_action :set_commentable
  before_action :set_comment_path

  private

  def set_commentable
    @commentable = Book.find(params[:book_id])
  end

  def set_comment_path
    @book = Book.find(params[:book_id])
    @comment_path = 'books/show'
  end
end
