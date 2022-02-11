# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar
  has_many :following_relationships, class_name: 'FollowRelationship', foreign_key: 'user_id'
  has_many :follower_relationships, class_name: 'FollowRelationship', foreign_key: 'follow_id'
  has_many :followings, through: :following_relationships, source: :follow
  has_many :followers, through: :follower_relationships, source: :user

  def following?(user)
    self.followings.include?(user)
  end
end
