# frozen_string_literal: true

require "rails_helper"

RSpec.describe Lessons::IndexService, "#run", type: :integration do
  let(:user) { create_user }
  let(:lesson) { create_lesson({ user: }) }
  let(:base_params) { { user: } }

  subject {
    result = described_class.run(params)
    result.log_error(Logger.new(STDOUT))
    result
  }

  context "when is size 1" do
    before { lesson }
    let(:params) { base_params.merge({}) }

    it { expect(subject.valid?).to be true }
    it { expect(subject.result.size).to eq 1 }
  end

  context "when is size 0" do
    before do
      tutor = create_tutor
      create_schedule({ tutor:, lesson: })
    end
    let(:params) { base_params.merge({}) }

    it { expect(subject.valid?).to be true }
    it { expect(subject.result.size).to eq 0 }
  end
end
