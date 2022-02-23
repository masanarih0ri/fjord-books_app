# frozen_string_literal: true

require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  test '#created_on' do
    user = User.new(id: 1, email: 'foo@example.com', name: 'foo')
    report = Report.new(id: 1, user_id: user.id, title: '日報タイトル', content: 'こんにちは', created_at: Time.zone.now, updated_at: Time.zone.now)
    assert_equal Time.zone.today, report.created_on
  end
end
