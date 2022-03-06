# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test '#name_or_email' do
    user = users(:name_blank_user)
    assert_equal 'foo@example.com', user.name_or_email

    user.name = 'foobar'
    assert_equal 'foobar', user.name_or_email
  end

  test '#follow' do
    alice = users(:alice)
    bob = users(:bob)
    assert_not alice.following?(bob)
    alice.follow(bob)
    assert alice.following?(bob)
  end

  test '#unfollow' do
    alice = users(:alice)
    bob = users(:bob)

    alice.follow(bob)
    assert alice.following?(bob)
    alice.unfollow(bob)
    assert_not alice.following?(bob)
  end

  test '#following?' do
    alice = users(:alice)
    bob = users(:bob)

    alice.follow(bob)

    assert alice.following?(bob)
  end

  test '#followed_by?' do
    alice = users(:alice)
    bob = users(:bob)

    alice.follow(bob)

    assert bob.followed_by?(alice)
  end
end
