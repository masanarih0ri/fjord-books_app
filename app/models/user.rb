# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :image

  validate :check_content_type, if: :attached?

  def check_content_type
    extension = ['image/png', 'image/jpeg', 'image/gif']
    errors.add(:image, 'の拡張子が間違っています。.png .jpg .jpeg .gifのいずれかにしてください。') unless image.content_type.in?(extension)
  end

  private

  def attached?
    image.attached?
  end
end
