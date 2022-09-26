# frozen_string_literal: true

class AddUidToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :uid, :string, after: :id
  end
end
