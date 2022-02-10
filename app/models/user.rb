# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar
  has_many :following_relationships, class_name: 'FollowRelationship', foreign_key: 'user_id'
  has_many :follower_relationships, class_name: 'FollowRelationship', foreign_key: 'follow_id'
  has_many :followings, through: :following_relationships, source: :follow
  has_many :followers, through: :following_relationships, source: :user

  def follow(user)
    unless self == user
      self.following_relationships.find_or_create_by(follow_id: user.id)
    end
  end

  def unfollow(user)
    follow_relationship = self.following_relationships.find_by(follow_id: user.id)
    follow_relationship.desroy if follow_relationship.present?
  end

  def following?(user)
    self.followings.include?(user)
  end
end
