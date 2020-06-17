OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
    provider :facebook, '1480998798729077', 'f265cc10c79ca893f821d79ba17236ff'
    provider :google_oauth2, '463463711280-vdfeo1ahqp02a626avn5k3qri817jpru.apps.googleusercontent.com', 'OuWIm8B9haH5nOggxCRK3A3w'
end

