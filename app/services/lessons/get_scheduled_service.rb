# frozen_string_literal: true

class Lessons::GetScheduledService < ServiceBase
  record :tutor, finder: :find_by_uid!, class: Tutor

  def execute
    Lesson.by_tutor(tutor)
  end
end
