OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
    provider :facebook, '1480998798729077', 'f265cc10c79ca893f821d79ba17236ff'
    provider :google_oauth2, '463463711280-bdpic0fsl75u99c0a8pgoi3ij8b3tj08.apps.googleusercontent.com', 'Lddpg81sZAlD9UDcAoVYDBqD'
end

