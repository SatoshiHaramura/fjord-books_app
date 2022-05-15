# frozen_string_literal: true

require 'application_system_test_case'

class ReportsTest < ApplicationSystemTestCase
  include Warden::Test::Helpers

  setup do
    login_as(users(:ellen))
  end

  test 'visiting the index' do
    visit reports_url
    assert_selector 'h1', text: '日報'
  end

  test 'creating a Report' do
    visit reports_url
    click_link '新規作成'

    fill_in 'タイトル', with: '【1日目】初めての日報'
    fill_in '内容', with: '本日、初めて日報を作成致しました。'
    click_button '登録する'

    assert_text '日報が作成されました。'
    assert_text '【1日目】初めての日報'
    assert_text '本日、初めて日報を作成致しました。'
    assert_text 'ellen@example.com'
  end

  test 'updating a Report' do
    visit reports_url
    click_link '編集'

    fill_in 'タイトル', with: '【1日目】初めての日報(修正版)'
    fill_in '内容', with: '本日、初めて日報を作成致しました。これから、宜しくお願いいたします。'
    click_button '更新する'

    assert_text '日報が更新されました。'
    assert_text '【1日目】初めての日報(修正版)'
    assert_text '本日、初めて日報を作成致しました。これから、宜しくお願いいたします。'
    assert_text 'ellen@example.com'
  end

  test 'destroying a Report' do
    visit reports_url
    page.accept_confirm do
      click_link '削除', match: :first
    end

    assert_text '日報が削除されました。'
    assert_no_text '【1日目】初めての日報(修正版)'
    assert_no_text '本日、初めて日報を作成致しました。これから、宜しくお願いいたします。'
  end

  test 'report should be commented' do
    visit reports_url
    click_link '詳細'
    fill_in 'comment[content]', with: '初めての日報、おめでとうございます!'
    click_button 'コメントする'

    assert_text 'コメントが投稿されました。'
    assert_text '初めての日報、おめでとうございます!'
    assert_text 'Ellen'
  end
end
