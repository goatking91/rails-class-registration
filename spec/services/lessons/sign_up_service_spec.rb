# frozen_string_literal: true

require "rails_helper"

RSpec.describe Lessons::SignUpService, "#run", type: :integration do
  let(:user) { create_user }
  let(:tutor) { create_tutor }
  let(:start_time) { DateTime.now }
  let(:base_params) { { user:, tutor:, start_time: } }

  subject {
    result = described_class.run(params)
    result.log_error(Logger.new(STDOUT))
    result
  }

  context "when is lesson minute 20 success" do
    before { create_schedule({ tutor:, start_time:, active: :available }) }
    let(:lesson) { create_lesson({ user:, minute: 20 }) }
    let(:params) { base_params.merge({ lesson: }) }

    it { expect(subject.valid?).to be true }
  end

  context "when is lesson minute 20 failed" do
    before { create_schedule({ tutor:, start_time:, active: :unavailable }) }
    let(:lesson) { create_lesson({ user:, minute: 20 }) }
    let(:params) { base_params.merge({ lesson: }) }

    it { expect { subject }.to raise_exception(Lessons::NoSignUpError) }
  end

  context "when is lesson minute 40 success" do
    before do
      create_schedule({ tutor:, start_time:, active: :available })
      create_schedule({ tutor:, start_time: start_time + 30.minute, active: :available })
    end
    let(:lesson) { create_lesson({ user:, minute: 40 }) }
    let(:params) { base_params.merge({ lesson: }) }

    it { expect(subject.valid?).to be true }
  end

  context "when is lesson minute 40 failed" do
    before { create_schedule({ tutor:, start_time:, active: :available }) }
    let(:lesson) { create_lesson({ user:, minute: 40 }) }
    let(:params) { base_params.merge({ lesson: }) }

    it { expect { subject }.to raise_exception(Lessons::NoSignUpError) }
  end

  context "when is not mine error" do
    before { create_schedule({ tutor:, start_time:, active: :available }) }
    let(:lesson) { create_lesson({ user:, minute: 20 }) }
    let(:params) { base_params.merge({ lesson:, user: create_user }) }

    it { expect { subject }.to raise_exception(Lessons::IsNotMineError) }
  end

  context "when is already used error" do
    before do
      @lesson = create_lesson({ user:, minute: 20 })
      create_schedule({ tutor:, start_time:, active: :available, lesson: @lesson })
    end
    let(:params) { base_params.merge({ lesson: @lesson, user: }) }

    it { expect { subject }.to raise_exception(Lessons::AlreadyUsedError) }
  end
end
