# frozen_string_literal: true

require "rails_helper"

RSpec.describe Tutors::CreateAvailableTimesService, "#run", type: :integration do
  let(:tutor) { create_tutor }
  let(:base_params) { { tutor: } }

  subject {
    result = described_class.run(params)
    result.log_error(Logger.new(STDOUT))
    result
  }

  context "when is size 2" do
    let(:available_times) { [start_time: DateTime.now, end_time: DateTime.now + 30.minute] }
    let(:params) { base_params.merge({ available_times: }) }

    it { expect(subject.valid?).to be true }
    it { expect(subject.result.size).to eq 2 }
  end

  context "when is size 1" do
    let(:available_times) { [start_time: DateTime.now, end_time: DateTime.now] }
    let(:params) { base_params.merge({ available_times: }) }

    it { expect(subject.valid?).to be true }
    it { expect(subject.result.size).to eq 1 }
  end

  context "when is failed" do
    let(:available_times) { [start_time: DateTime.now + 30.minute, end_time: DateTime.now] }
    let(:params) { base_params.merge({ available_times: }) }

    it { expect { subject }.to raise_exception(Tutors::CheckTimeError) }
  end
end
