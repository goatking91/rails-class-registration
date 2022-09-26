# frozen_string_literal: true

require "active_support/concern"
module ApplicationSpecSupport
  extend ActiveSupport::Concern

  def create_tutor
    create(:tutor, name: FFaker::NameKR.name, cellphone: FFaker::PhoneNumberKR.mobile_phone_number.strip)
  end

  def create_user
    create(:user, name: FFaker::NameKR.name, cellphone: FFaker::PhoneNumberKR.mobile_phone_number.strip)
  end

  def create_lesson(params = {})
    params[:user] = create_user if params[:user].nil?
    params[:minute] = 20 if params[:minute].nil?
    create(:lesson, params)
  end

  def create_schedule(params = {})
    params[:tutor] = create_tutor if params[:tutor].nil?
    create(:schedule, params)
  end
end
