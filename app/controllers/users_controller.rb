# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    @users = User.with_attached_avatar.order(:id).page(params[:page])
  end

  def show
    @user = User.find(params[:id])
    @follow_relationship = FollowRelationship.find_by(user_id: current_user.id, follow_id: @user.id)
    @followings = @user.followings
    @followers = @user.followers
  end
end
