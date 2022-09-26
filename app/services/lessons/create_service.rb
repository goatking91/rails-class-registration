# frozen_string_literal: true

class Lessons::CreateService < ServiceBase
  record :user, finder: :find_by_uid!, class: User
  integer :minute
  string :content

  validates :minute, inclusion: { in: [20, 40], message: "%{value}는 허용된 값이 아닙니다." }

  def execute
    Lesson.create!(user:, minute:, content:)
  end
end
