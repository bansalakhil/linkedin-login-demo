Rails.application.config.middleware.use OmniAuth::Builder do
  provider :linkedin, ENV['linked_in_client_id'], ENV['linked_in_client_secret'], secure_image_url: true, provider_ignores_state: true
end

OmniAuth.config.on_failure = Proc.new { |env|
  OmniAuth::FailureEndpoint.new(env).redirect_to_failure
}
