class FollowRelationshipsController < ApplicationController
  def create
    @follow_user = User.find(params[:follow_id])
    @follow_relationship = FollowRelationship.new(user_id: params[:user_id], follow_id: params[:follow_id])
    if @follow_relationship.save
       flash[:success] = 'ユーザーをフォローしました'
    else
       flash[:danger] = 'ユーザーをフォローできませんでした'
    end
    redirect_to user_path(@follow_user)
  end

  def destroy
    @follow_user = User.find(params[:follow_id])
    @follow_relationship = FollowRelationship.find(params[:id])
    if @follow_relationship.destroy
       flash[:success] = 'ユーザーのフォローを解除しました'
    else
       flash[:danger] = 'ユーザーのフォローを解除できませんでした'
    end
    redirect_to user_path(@follow_user)
  end
end