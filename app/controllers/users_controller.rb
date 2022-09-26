# frozen_string_literal: true

class UsersController < ApplicationController
  def create
    result = Users::CreateService.run!(create_params)
    render api: result, status: :created
  end

  private
    def create_params
      api_params.permit(:name, :cellphone)
    end
end
