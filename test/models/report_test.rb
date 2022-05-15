# frozen_string_literal: true

require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  test 'editable? userと引数が同じのときtrueを返す' do
    alice = users(:alice)
    report = alice.reports.create!(title: '【1日目】初めての日報', content: '本日、初めて日報を作成致しました。')

    assert_equal(true, report.editable?(alice))
  end

  test 'editable? userと引数が異なるときfalseを返す' do
    alice = users(:alice)
    bob = users(:bob)
    report = alice.reports.create!(title: '【1日目】初めての日報', content: '本日、初めて日報を作成致しました。')

    assert_equal(false, report.editable?(bob))
  end

  test 'created_on' do
    report = Report.new(created_at: DateTime.new(2022, 2, 5, 12, 30, 45))

    assert_equal Date.new(2022, 2, 5), report.created_on
  end
end
