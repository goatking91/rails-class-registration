# frozen_string_literal: true

class Lessons::SignUpService < ServiceBase
  record :user, finder: :find_by_uid!, class: User
  record :tutor, finder: :find_by_uid!, class: Tutor
  record :lesson, finder: :find_by_uid!, class: Lesson
  date_time :start_time, format: "%Y-%m-%dT%H:%M%z"

  def execute
    my_lesson!
    already_used!
    sign_up!
    lesson.reload
  end

  private
    def my_lesson!
      raise Lessons::IsNotMineError if lesson.user != user
    end

    def already_used!
      raise Lessons::AlreadyUsedError if lesson.schedules.size > 0
    end

    def sign_up!
      schedules = Schedule.by_tutor(tutor).by_active(:available)

      case lesson.minute
      when 20
        schedules = schedules.by_start_time(start_time)
        raise Lessons::NoSignUpError if schedules.size != 1
      when 40
        schedules = schedules.by_start_time(start_time..start_time + 30.minute)
        raise Lessons::NoSignUpError if schedules.size != 2
      end

      schedules.each do |schedule|
        schedule.update!(active: :unavailable, lesson:)
      end
    end
end
