# frozen_string_literal: true

class Tutor < ApplicationRecord
  has_secure_token :uid

  scope :by_cellphone, -> (cellphone) { where(cellphone:) }
end
