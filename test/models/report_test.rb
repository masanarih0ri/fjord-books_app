# frozen_string_literal: true

require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  test '#created_on' do
    user = users(:alice)
    report = reports(:first_report)
    assert_equal Time.zone.today, report.created_on
  end

  test '#editable?' do
    user1 = users(:alice)
    user2 = users(:bob)
    report = reports(:first_report)
    report.user = user1
    assert report.editable?(user1)
    assert_not report.editable?(user2)
  end
end
