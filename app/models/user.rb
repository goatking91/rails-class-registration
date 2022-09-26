# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_token :uid

  scope :by_cellphone, -> (cellphone) { where(cellphone:) }
end
