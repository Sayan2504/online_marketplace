OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
    provider :facebook, '1480998798729077', 'f265cc10c79ca893f821d79ba17236ff'
    provider :google_oauth2, '463463711280-rd27qeqqtsgc8j60qplo3rnjg0ehq67f.apps.googleusercontent.com', 'B8N-OaIeMMOWVMZ9qHOOEM4F'
end

