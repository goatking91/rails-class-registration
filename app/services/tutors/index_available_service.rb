# frozen_string_literal: true

class Tutors::IndexAvailableService < ServiceBase
  record :user, finder: :find_by_uid!, class: User
  date_time :start_time, format: "%Y-%m-%dT%H:%M"
  integer :minute

  set_callback :validate, :after, :with_time_zone

  def execute
    schedules = Schedule.by_active(:available).by_start_time(start_time).filter do
      if minute == 40 && Schedule.by_active(:available).by_start_time(start_time + 30.minute).size == 0
        false
      else
        true
      end
    end
    schedules.collect(&:tutor).uniq
  end

  private
    def with_time_zone
      @start_time = @start_time.change(offset: Time.zone.formatted_offset)
    end
end
