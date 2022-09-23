# frozen_string_literal: true

require "rails_helper"

RSpec.describe ErrorsController, type: :controller do
  describe "GET #default" do
    it "returns http success" do
      get :default
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #bad_params" do
    it "returns http success" do
      get :bad_params
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #missing" do
    it "returns http success" do
      get :missing
      expect(response).to have_http_status(:success)
    end
  end
end
