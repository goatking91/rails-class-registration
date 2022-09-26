# frozen_string_literal: true

class AddLessonIdToSchedules < ActiveRecord::Migration[7.0]
  def change
    add_reference :schedules, :lesson, after: :tutor_id
  end
end
