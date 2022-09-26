# frozen_string_literal: true

class Tutors::CreateAvailableTimesService < ServiceBase
  record :tutor, finder: :find_by_uid!, class: Tutor

  array :available_times do
    hash do
      date_time :start_time, format: "%Y-%m-%dT%H:%M%z"
      date_time :end_time, format: "%Y-%m-%dT%H:%M%z"
    end
  end

  def execute
    split_times.collect do |time|
      schedule = Schedule.find_or_create_by!(tutor:, start_time: time)
      schedule.update!(active: :available) if schedule.active.nil?
      schedule
    end
  end

  private
    def check_times(start_time, end_time)
      raise Tutors::CheckTimeError if start_time > end_time
    end

    def split_times
      available_times.collect_concat do |available_time|
        check_times(available_time[:start_time], available_time[:end_time])
        range = available_time[:start_time].to_i..available_time[:end_time].to_i
        range.step(30.minute.to_i).collect { |t| Time.at(t) }
      end.uniq
    end
end
