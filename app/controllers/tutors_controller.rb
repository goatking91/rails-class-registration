# frozen_string_literal: true

class TutorsController < ApplicationController
  before_action :set_tutor, only: [:available_time]

  def create
    result = Tutors::CreateService.run!(create_params)
    render api: result, status: :created
  end

  def available_time
    result = Tutors::CreateAvailableTimesService.run!(available_time_params)
    render api: result, status: :created
  end

  private
    def create_params
      api_params.permit(:name, :cellphone)
    end

    def available_time_params
      api_params.permit(available_times: [:date, :start_time, :end_time]).merge(tutor: @tutor)
    end

    def set_tutor
      uid = api_params.permit(:uid).fetch(:uid, nil)
      @tutor = Tutor.find_by(uid:)
    end
end
