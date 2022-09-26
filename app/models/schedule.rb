# frozen_string_literal: true

class Schedule < ApplicationRecord
  belongs_to :tutor
  belongs_to :lesson, optional: true

  enum active: { available: 1, unavailable: 2 }

  scope :by_active, -> (active) { where(active:) }
  scope :by_start_time, -> (start_time) { where(start_time:) }
end
