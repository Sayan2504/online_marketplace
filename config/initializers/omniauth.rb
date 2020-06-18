OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
    provider :facebook, '2794828067293487', '7976c658387a525b0f4b509909b6d96d'
    provider :google_oauth2, '463463711280-bdpic0fsl75u99c0a8pgoi3ij8b3tj08.apps.googleusercontent.com', 'Lddpg81sZAlD9UDcAoVYDBqD'
end

