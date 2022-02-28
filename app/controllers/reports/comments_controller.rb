# frozen_string_literal: true

class Reports::CommentsController < CommentsController
  before_action :set_commentable
  before_action :set_comment_path

  private

  def set_commentable
    @commentable = Report.find(params[:report_id])
  end

  def set_comment_path
    @report = Report.find(params[:report_id])
    @comment_path = 'reports/show'
  end
end
