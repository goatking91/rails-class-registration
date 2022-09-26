# frozen_string_literal: true

class CreateSchedules < ActiveRecord::Migration[7.0]
  def change
    create_table :schedules do |t|
      t.references :tutor
      t.datetime :start_time
      t.integer :active
      t.timestamps
    end
  end
end
