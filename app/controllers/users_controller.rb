# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    @users = User.order(:id).page(params[:page]).per(5)
  end
end
