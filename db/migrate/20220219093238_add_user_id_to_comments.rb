# frozen_string_literal: true

class AddUserIdToComments < ActiveRecord::Migration[6.1]
  def change
    add_reference :comments, :user, foreign_key: true, before: :created_at
  end
end
