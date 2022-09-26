# frozen_string_literal: true

Rails.application.routes.draw do
  get "welcome/ping"
  get "error/default"
  get "error/missing"
  match "/500" => "errors#default", via: [:get, :post, :put, :patch, :delete]
  match "/400" => "errors#bad_params", via: [:get, :post, :put, :patch, :delete]
  match "/404" => "errors#missing", via: [:get, :post, :put, :patch, :delete]
  match "/health/ping" => "welcome#ping", via: [:get, :post, :put, :patch, :delete]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  scope "/api" do
    scope "/v1" do
      get "health/ping", to: "welcome#ping"

      resources :users, controller: :users, param: :uid, only: [:create] do
        member do
          post :lessons
        end
      end

      resources :tutors, controller: :tutors, param: :uid, only: [:create] do
        member do
          post :available_time, path: "available-time"
        end
      end
    end
  end
end
