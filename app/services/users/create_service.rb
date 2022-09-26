# frozen_string_literal: true

class Users::CreateService < ServiceBase
  string :name, :cellphone

  def execute
    raise Users::IsExistError if user_exist?
    User.create(name:, cellphone:)
  end

  private
    def user_exist?
      User.by_cellphone(cellphone).size > 0
    end
end
