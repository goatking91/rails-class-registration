# frozen_string_literal: true

class AddUidToTutors < ActiveRecord::Migration[7.0]
  def change
    add_column :tutors, :uid, :string, after: :id
  end
end
