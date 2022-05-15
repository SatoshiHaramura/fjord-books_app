# frozen_string_literal: true

class AddZipCodeToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :zip_code, :string
  end
end
