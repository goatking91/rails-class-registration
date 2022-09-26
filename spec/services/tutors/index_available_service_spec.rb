# frozen_string_literal: true

require "rails_helper"

RSpec.describe Tutors::IndexAvailableService, "#run", type: :integration do
  let(:user) { create_user }
  let(:start_time) { DateTime.now }
  let(:tutor) { create_tutor }
  let(:base_params) { { user:, start_time: } }

  subject {
    result = described_class.run(params)
    result.log_error(Logger.new(STDOUT))
    result
  }

  context "when is minute 20 and size 1" do
    before { create_schedule({ tutor:, start_time:, active: :available }) }
    let(:params) { base_params.merge({ minute: 20 }) }

    it { expect(subject.valid?).to be true }
    it { expect(subject.result.size).to be 1 }
  end

  context "when is minute 40 and size 1" do
    before do
      create_schedule({ tutor:, start_time:, active: :available })
      create_schedule({ tutor:, start_time: start_time + 30.minute, active: :available })
    end
    let(:params) { base_params.merge({ minute: 40 }) }

    it { expect(subject.valid?).to be true }
    it { expect(subject.result.size).to be 1 }
  end

  context "when is minute 40 and size 0" do
    before do
      create_schedule({ tutor:, start_time:, active: :available })
      create_schedule({ tutor:, start_time: start_time + 30.minute, active: :unavailable })
    end
    let(:params) { base_params.merge({ minute: 40 }) }

    it { expect(subject.valid?).to be true }
    it { expect(subject.result.size).to be 0 }
  end
end
