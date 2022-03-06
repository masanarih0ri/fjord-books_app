# frozen_string_literal: true

require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  test '#created_on' do
    report = reports(:first_report)
    assert_equal Time.zone.today, report.created_on
  end

  test '#editable?' do
    alice = users(:alice)
    bob = users(:bob)
    report = reports(:first_report)
    assert report.editable?(alice)
    assert_not report.editable?(bob)
  end
end
