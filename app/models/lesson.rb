# frozen_string_literal: true

class Lesson < ApplicationRecord
  has_secure_token :uid
  belongs_to :user
  has_many :schedules
end
