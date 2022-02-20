# frozen_string_literal: true

class FollowRelationshipsController < ApplicationController
  def create
    @follow_user = User.find(params[:follow_id])
    @follow_relationship = FollowRelationship.new(follow_relationship_params)
    @follow_relationship.user_id = current_user.id
    if @follow_relationship.save
      flash[:success] = 'ユーザーをフォローしました'
    else
      flash[:danger] = 'ユーザーをフォローできませんでした'
    end
    redirect_to user_path(@follow_user)
  end

  def destroy
    @follow_relationship = FollowRelationship.find(params[:id])
    if @follow_relationship.destroy
      flash[:success] = 'ユーザーのフォローを解除しました'
    else
      flash[:danger] = 'ユーザーのフォローを解除できませんでした'
    end
    redirect_to user_path(@follow_relationship.follow.id)
  end

  private

  def follow_relationship_params
    params.permit(:follow_id)
  end
end
