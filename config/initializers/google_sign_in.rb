# config/initializers/google_sign_in.rb
Rails.application.configure do
    config.google_sign_in.client_id     = ENV['google_sign_in_client_id']
    config.google_sign_in.client_secret = ENV['google_sign_in_client_secret']
  end
  