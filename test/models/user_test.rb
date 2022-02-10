# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'following? 引数をフォロー中にtrueを返す' do
    alice = users(:alice)
    bob = users(:bob)

    assert_equal(false, alice.following?(bob))

    alice.follow(bob)
    assert_equal(true, alice.following?(bob))
  end

  test 'following? 引数をフォローしていない時にfalseを返す' do
    alice = users(:alice)
    bob = users(:bob)

    assert_equal(false, alice.following?(bob))
  end

  test 'followed_by? 引数にフォローされている時にtrueを返す' do
    alice = users(:alice)
    bob = users(:bob)

    assert_equal(false, alice.followed_by?(bob))
    bob.follow(alice)
    assert_equal(true, alice.followed_by?(bob))
  end

  test 'followed_by? 引数にフォローされていない時にfalseを返す' do
    alice = users(:alice)
    bob = users(:bob)

    assert_equal(false, alice.followed_by?(bob))
  end

  test 'follow 引数をフォロー中またはフォローしていない時にフォロー中とする' do
    alice = users(:alice)
    bob = users(:bob)

    alice.follow(bob)
    assert alice.followings.include?(bob)
    alice.follow(bob)
    assert alice.followings.include?(bob)
  end

  test 'unfollow 引数をフォローしている時にフォローを解除する' do
    alice = users(:alice)
    bob = users(:bob)

    alice.follow(bob)
    alice.unfollow(bob)
    assert_equal(false, alice.following?(bob))
  end

  test 'unfollow 引数をフォローしていない時にnilを返す' do
    alice = users(:alice)
    bob = users(:bob)

    assert_nil(alice.unfollow(bob))
  end

  test 'name_or_email nameが存在する時#nameを返す' do
    users(:alice).update(name: 'Alice')
    alice = users(:alice)

    assert_equal 'Alice', alice.name_or_email
  end

  test 'name_or_email nameが存在しない時#emailを返す' do
    alice = users(:alice)

    assert_equal 'alice@example.com', alice.name_or_email
  end
end
