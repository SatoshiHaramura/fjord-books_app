# frozen_string_literal: true

require 'application_system_test_case'

class UsersTest < ApplicationSystemTestCase
  include Warden::Test::Helpers

  setup do
    login_as(users(:ellen))
  end

  test 'visiting the index' do
    visit users_url
    assert_selector 'h1', text: 'ユーザ'
  end

  test 'visiting the show' do
    visit users_url
    click_link '詳細'

    assert_text 'ellen@example.com'
    assert_text 'Ellen'
    assert_text '123-4567'
    assert_text '東京都'
    assert_text 'Ellenといいます。よろしくお願いいたします。'
  end

  test 'visiting the followings index' do
    visit users_url
    click_link '詳細'
    click_link '0 フォロー'

    assert_selector 'h1', text: 'フォロー'
  end

  test 'visiting the followers index' do
    visit users_url
    click_link '詳細'
    click_link '0 フォロワー'

    assert_selector 'h1', text: 'フォロワー'
  end

  test 'should follow and unfollow a user' do
    alice = users(:alice)

    visit user_url(alice)

    click_button 'フォローする'

    assert_text 'フォローしました。'
    assert_text '1 フォロワー'

    click_button 'フォロー解除する'

    assert_text 'フォロー解除しました。'
    assert_text '0 フォロワー'
  end
end
