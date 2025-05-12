module Radius
  class RadiusController < ApplicationController
    allow_unauthenticated_access
    skip_forgery_protection
    before_action :set_radius_user

    def authorize
      authorization_request = Radius::AuthorizationRequest.new
      authorization_request.username = params["User-Name"]
      authorization_request.calledStationId = params["Called-Station-Id"]
      authorization_request.callingStationId = params["Calling-Station-Id"]
      authorization_request.accountingSessionId = params["Acct-Session-Id"]
      authorization_request.accountingMultiSessionId = params["Acct-Multi-Session-Id"]
      authorization_request.radius_user = @radius_user

      if params["User-Password"]
        if !@radius_user.nil? && @radius_user.password == params["User-Password"]
          authorization_request.password_correct!
          render json: {}
        else
          if @radius_user.nil?
            authorization_request.password_wrong!
          else
            authorization_request.password_no_user!
          end
          head :not_found, "content_type" => "application/json"
        end
      elsif !@radius_user.nil?
        authorization_request.found_user!
        render json: {"control:Cleartext-Password": @radius_user.password}
      else
        authorization_request.no_user!
        head :not_found, "content_type" => "application/json"
      end
    end

    def authenticate
      render json: {}
    end

    def accounting
      logger.debug params
      render json: {}
    end

    def post_auth
      post_authorization = Radius::PostAuthorization.new
      post_authorization.username = params["User-Name"]
      post_authorization.calledStationId = params["Called-Station-Id"]
      post_authorization.callingStationId = params["Calling-Station-Id"]
      post_authorization.accountingSessionId = params["Acct-Session-Id"]
      post_authorization.accountingMultiSessionId = params["Acct-Multi-Session-Id"]
      post_authorization.radius_user = @radius_user

      if !@radius_user.nil?
        post_authorization.user_authorized!
        render json: {
          "reply:Tunnel-Type": "13",
          "reply:Tunnel-Medium-Type": "6",
          "reply:Tunnel-Private-Group-ID": "3"
        }
      else
        post_authorization.no_user!
        head :not_found, "content_type" => "application/json"
      end
    end

    protected

    def set_radius_user
      @radius_user = Radius::User.where(username: params["User-Name"]).first
    end
  end
end
