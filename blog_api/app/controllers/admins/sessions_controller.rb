module Admins
  class SessionsController < ApplicationController
    before_filter :ensure_params_exist

    def create
      admin = Admin.find_for_database_authentication(:email => params[:user_login][:email])
      return invalid_login_attempt unless admin

      if admin.valid_password?(params[:user_login][:password])
        SignsInAdmin.new(admin).perform
        render :json=> {:success=>true, :auth_token=>admin.authentication_token, :email=>admin.email}
        return
      end

      invalid_login_attempt
    end

    protected

    def invalid_login_attempt
      render :json=> {:success=>false, :message=>"Error with your login or password"}, :status=>401
    end

    def ensure_params_exist
      return unless params[:user_login].blank?
      render json: { success: false, message: "missing user_login parameter" }, status: 422
    end

  end
end

