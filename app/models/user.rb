# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :image

  validate :check_content_type, if: :image_attached?

  def check_content_type
    content_types = ['image/png', 'image/jpeg', 'image/gif']
    errors.add(:image, 'の拡張子が間違っています。.png .jpg .jpeg .gifのいずれかにしてください。') unless image.content_type.in?(content_types)
  end

  private

  def image_attached?
    image.attached?
  end
end
