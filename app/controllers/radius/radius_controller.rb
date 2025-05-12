module Radius
  class RadiusController < ApplicationController
    allow_unauthenticated_access
    skip_forgery_protection
    before_action :set_radius_user

    def authorize
      logger.debug params

      if params["User-Password"]
        if !@radius_user.nil? && @radius_user.password == params["User-Password"]
          render json: {}
        else
          head :not_found, "content_type" => "application/json"
        end
      elsif !@radius_user.nil?
        render json: {"control:Cleartext-Password": @radius_user.password}
      else
        head :not_found, "content_type" => "application/json"
      end
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

      if !@radius_user.nil?
        render json: {
          "reply:Tunnel-Type": "13",
          "reply:Tunnel-Medium-Type": "6",
          "reply:Tunnel-Private-Group-ID": "3"
        }
      else
        head :not_found, "content_type" => "application/json"
      end
    end

    protected

    def set_radius_user
      @radius_user = Radius::User.where(username: params["User-Name"]).first
    end
  end
end
