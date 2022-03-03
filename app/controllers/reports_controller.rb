# frozen_string_literal: true

class ReportsController < ApplicationController
  def index
    @reports = Report.order(:id).page(params[:page])
  end

  def new
    @report = Report.new
  end

  def create
    @report = Report.new(report_params)
    @report.user = current_user
    if @report.save
      flash[:notice] = t('.notice')
      redirect_to reports_path
    else
      flash[:alert] = t('.alert')
      render :new
    end
  end

  def edit
    @report = Report.find(params[:id])
  end

  def update
    @report = Report.find(params[:id])
    if @report.user == current_user && @report.update!(report_params)
      flash[:notice] = t('.notice')
      redirect_to edit_report_path(@report)
    else
      flash[:alert] = t('.alert')
      render :edit
    end
  end

  def show
    @report = Report.find(params[:id])
  end

  def destroy
    @report = Report.find(params[:id])
    if @report.destroy
      flash[:notice] = t('.notice')
      redirect_to reports_path
    else
      flash[:alert] = t('.alert')
      redirect_to report_path(@report)
    end
  end

  private

  def report_params
    params.require(:report).permit(:title, :body)
  end
end
