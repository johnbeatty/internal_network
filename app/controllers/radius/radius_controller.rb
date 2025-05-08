module Radius
  class RadiusController < ApplicationController
    allow_unauthenticated_access
    skip_forgery_protection

    def authorize
      logger.debug params
      if params["User-Password"]
        render json: {}
      else
        render json: {"control:Cleartext-Password": "hello2"}
      end
      # head :ok
    end

    def authenticate
      logger.debug params
      render json: {}
    end

    def accounting
      logger.debug params
    end

    def post_auth
      logger.debug params
    end
  end
end
