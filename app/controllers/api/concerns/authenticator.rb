module Api
    module Concerns
      module Authenticator
  
        extend ActiveSupport::Concern
        include ActionController::HttpAuthentication::Basic::ControllerMethods 

        included do
          before_action :http_authenticate
        end
  
        def http_authenticate
          authenticate_or_request_with_http_basic do |username, password|
            username == Rails.application.credentials.dig(:basic_auth, :username) && password == Rails.application.credentials.dig(:basic_auth, :password)
          end
        end
  
      end
    end
  end