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
end
