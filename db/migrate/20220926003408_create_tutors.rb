# frozen_string_literal: true

class CreateTutors < ActiveRecord::Migration[7.0]
  def change
    create_table :tutors do |t|
      t.string :name
      t.string :cellphone
      t.timestamps
    end
  end
end
