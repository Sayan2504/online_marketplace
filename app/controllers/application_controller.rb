class ApplicationController < ActionController::Base
    include SessionsHelper
    include NotificationsHelper

    def no_browser_cache
      response.headers["Last-Modified"] = Time.now.httpdate
      # response.headers["Expires"] = 0 -> this line kills heroku deployments
      # HTTP 1.0
      response.headers["Pragma"] = "no-cache"
      # HTTP 1.1 'pre-check=0, post-check=0' (IE specific)
      response.headers["Cache-Control"] = 'no-store, no-cache, must-revalidate, max-age=0, pre-check=0, post-check=0'
    end
end
