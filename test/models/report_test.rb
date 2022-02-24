# frozen_string_literal: true

require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  test '#created_on' do
    user = User.new(id: 1, email: 'alice@example.com', name: 'alice')
    report = Report.new(id: 1, user_id: user.id, title: '日報タイトル', content: 'こんにちは', created_at: Time.zone.now, updated_at: Time.zone.now)
    assert_equal Time.zone.today, report.created_on
  end

  test '#editable?' do
    user1 = User.new(id: 1, email: 'alice@example.com', name: 'alice')
    user2 = User.new(id: 2, email: 'bob@example.com', name: 'bob')
    report = Report.new(id: 1, user_id: user1.id, title: '日報タイトル', content: 'こんにちは', created_at: Time.zone.now, updated_at: Time.zone.now)
    report.user = user1
    assert report.editable?(user1)
    assert_not report.editable?(user2)
  end
end
