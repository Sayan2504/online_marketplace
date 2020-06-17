OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
    provider :facebook, '1480998798729077', 'f265cc10c79ca893f821d79ba17236ff'
    provider :google_oauth2, '463463711280-jj6b3q23i3f25qmgdb44gmqkh25us3i4.apps.googleusercontent.com', 'QpgWQwD9a2ttrdVDhnK7BPzs'
end

