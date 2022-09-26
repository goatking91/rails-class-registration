# frozen_string_literal: true

class Tutors::CreateService < ServiceBase
  string :name, :cellphone

  def execute
    raise Tutors::IsExistError if tutor_exist?
    Tutor.create(name:, cellphone:)
  end

  private
    def tutor_exist?
      Tutor.by_cellphone(cellphone).size > 0
    end
end
