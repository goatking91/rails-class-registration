# frozen_string_literal: true

Rails.application.configure do
  url = ENV.fetch("REDIS_DSN")
  if url.blank?
    throw Redis::CannotConnectError.new
  end
  config.redis = Redis.new(url:)
end
