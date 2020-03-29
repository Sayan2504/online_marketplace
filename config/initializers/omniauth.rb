OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
    provider :facebook, '1480998798729077', 'f265cc10c79ca893f821d79ba17236ff'
end

