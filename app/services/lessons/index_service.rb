# frozen_string_literal: true

class Lessons::IndexService < ServiceBase
  record :user, finder: :find_by_uid!, class: User

  def execute
    lessons = Lesson.by_user(user)
    lessons.filter { |lesson| lesson.schedules.size == 0 }
  end
end
