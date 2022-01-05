# frozen_string_literal: true

class AddUserToComments < ActiveRecord::Migration[6.1]
  def change
    add_reference :comments, :user, foreign_key: true
  end
end