# frozen_string_literal: true

require "rails_helper"

RSpec.describe Lessons::CreateService, "#run", type: :integration do
  let(:user) { create_user }
  let(:base_params) { { user:, content: FFaker::LoremKR.paragraph } }

  subject {
    result = described_class.run(params)
    result.log_error(Logger.new(STDOUT))
    result
  }

  context "when is success" do
    let(:params) { base_params.merge({ minute: 20 }) }

    it { expect(subject.valid?).to be true }
    it { expect(subject.result.minute).to eq 20 }
  end

  context "when is failed" do
    let(:params) { base_params.merge({ minute: 25 }) }
    it { expect(subject.valid?).to be false }
  end
end
