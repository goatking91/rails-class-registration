# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_user, only: [:create_lessons, :index_lessons, :index_tutors]

  def create
    result = Users::CreateService.run!(create_params)
    render api: result, status: :created
  end

  def create_lessons
    result = Lessons::CreateService.run!(create_lessons_params)
    render api: result, status: :created
  end

  def index_lessons
    result = Lessons::IndexService.run!(index_lessons_params)
    render api: result, status: :ok
  end

  def index_tutors
    result = Tutors::IndexAvailableService.run!(index_tutors_params)
    render api: result, status: :ok
  end

  private
    def create_params
      api_params.permit(:name, :cellphone)
    end

    def create_lessons_params
      api_params.permit(:minute, :content).merge(user: @user)
    end

    def index_lessons_params
      api_params.permit.merge(user: @user)
    end

    def index_tutors_params
      api_params.permit(:start_time, :minute).merge(user: @user)
    end

    def set_user
      uid = api_params.permit(:uid).fetch(:uid, nil)
      @user = User.find_by(uid:)
    end
end
