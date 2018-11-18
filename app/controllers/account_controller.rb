class AccountController < ApplicationController
  before_action :restrict_access, except: [:index]

  def signin
    token = ApiKey.create!
    msg = { token: token.access_token }
    respond_to do |format|
      format.json { render json.msg }
    end
  end

  def signout
    authenticate_or_request_with_http_token do |token, options|
      token = ApiKey.find_by(access_token: token)
      if token != nil
        token.destroy
      end
    end
    msg = { status: "OK" }
    respond_to do |format|
      format.json { render json: msg }
    end
  end

  private

    def restrict_access
      authenticate_or_request_with_http_token do |token, options|
        ApiKey.exists?(access_token: token)
      end
    end
end
