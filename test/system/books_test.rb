# frozen_string_literal: true

require 'application_system_test_case'

class BooksTest < ApplicationSystemTestCase
  include Warden::Test::Helpers

  setup do
    login_as(users(:ellen))
  end

  test 'visiting the index' do
    visit books_url
    assert_selector 'h1', text: '本'
  end

  test 'creating a Book' do
    visit books_url
    click_link '新規作成'

    fill_in 'タイトル', with: 'Ruby超入門'
    fill_in 'メモ', with: 'Rubyの文法の基本をやさしくていねいに解説しています。'
    fill_in '著者', with: '五十嵐 邦明'
    attach_file '画像', 'test/fixtures/files/cho-nyumon.jpg'
    click_button '登録する'

    assert_text '本が作成されました。'
    assert_text 'Ruby超入門'
    assert_text 'Rubyの文法の基本をやさしくていねいに解説しています。'
    assert_text '五十嵐 邦明'
    assert_selector 'img'
  end

  test 'updating a Book' do
    visit books_url
    click_link '編集'

    fill_in 'タイトル', with: 'チェリー本'
    fill_in 'メモ', with: 'プログラミング経験者のためのRuby入門書です。'
    fill_in '著者', with: '伊藤 淳一'
    attach_file '画像', 'test/fixtures/files/cherry-book.jpg'
    click_button '更新する'

    assert_text '本が更新されました。'
    assert_text 'チェリー本'
    assert_text 'プログラミング経験者のためのRuby入門書です。'
    assert_text '伊藤 淳一'
    assert_selector 'img'
  end

  test 'destroying a Book' do
    visit books_url
    page.accept_confirm do
      click_link '削除', match: :first
    end

    assert_text '本が削除されました。'
  end

  test 'book should be commented' do
    visit books_url
    click_link '詳細'
    fill_in 'comment[content]', with: '名著です。'
    click_button 'コメントする'

    assert_text 'コメントが投稿されました。'
    assert_text '名著です。'
    assert_text 'Ellen'
  end
end
