# frozen_string_literal: true

require "rails_helper"

RSpec.describe Users::CreateService, "#run", type: :integration do
  let(:name) { FFaker::NameKR.name }
  let(:cellphone) { FFaker::PhoneNumberKR.mobile_phone_number.strip }
  let(:base_params) { { name:, cellphone: } }

  subject {
    result = described_class.run(params)
    result.log_error(Logger.new(STDOUT))
    result
  }

  context "when is success" do
    let(:params) { base_params.merge({}) }

    it { expect(subject.valid?).to be true }
    it { expect(subject.result.name).to eq name }
    it { expect(subject.result.cellphone).to eq cellphone }
  end

  context "when is user_exist" do
    before { User.create(name:, cellphone:) }
    let(:params) { base_params.merge({}) }

    it { expect { subject }.to raise_exception(Users::IsExistError) }
  end
end
