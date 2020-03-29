OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
    provider :facebook, '1480998798729077', 'f265cc10c79ca893f821d79ba17236ff'
    provider :google_oauth2, '351807724361-8pg9153r423juiqk663ann9879kf56cp.apps.googleusercontent.com', '8KW9Z5bEKkYkfpgSzQdvxVx-'
    {
      scope: 'userinfo.email, userinfo.profile, http://gdata.youtube.com',
      prompt: 'select_account',
      image_aspect_ratio: 'square',
      image_size: 50
    }
end

