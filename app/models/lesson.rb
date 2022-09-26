# frozen_string_literal: true

class Lesson < ApplicationRecord
  has_secure_token :uid
  belongs_to :user
  has_many :schedules

  scope :with_user, -> { includes(:user).references(:users) }
  scope :by_user, -> (user) { with_user.where(user:) }
end
