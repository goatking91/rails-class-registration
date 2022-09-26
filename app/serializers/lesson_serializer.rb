# frozen_string_literal: true

class LessonSerializer < ApplicationSerializer
  attributes :minute, :content
  belongs_to :user
  has_many :schedules
end
