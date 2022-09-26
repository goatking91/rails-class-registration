# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_user, only: [:lessons]

  def create
    result = Users::CreateService.run!(create_params)
    render api: result, status: :created
  end

  def lessons
    result = Lessons::CreateService.run!(lessons_params)
    render api: result, status: :created
  end

  private
    def create_params
      api_params.permit(:name, :cellphone)
    end

    def lessons_params
      api_params.permit(:minute, :content).merge(user: @user)
    end

    def set_user
      uid = api_params.permit(:uid).fetch(:uid, nil)
      @user = User.find_by(uid:)
    end
end
