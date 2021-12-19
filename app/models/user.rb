# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :icon_image

  validates :icon_image, attached: true, content_type: %i[jpg png gif]
end
