# frozen_string_literal: true

class Book < ApplicationRecord
  mount_uploader :picture, PictureUploader

  # バリデーションのエラーメッセージを確認するために追加
  validates :title, presence: true
  validates :author, presence: true
end
