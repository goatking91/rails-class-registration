# frozen_string_literal: true

class ScheduleSerializer < ApplicationSerializer
  attributes :start_time, :active
  belongs_to :tutor

  def active
    object.active.upcase
  end
end
