class Api::V1::BaseController < ApplicationController
  
  protect_from_forgery with: :null_session
  skip_before_filter :authenticate_user!
  before_action :destroy_session
  #before_action :authenticate_api_user!
  rescue_from StandardError do |error|
    log_error(error)
    server_error!(error)
  end
  
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found!
  
  private
  
  def authenticate_api_user!
    token, options = ActionController::HttpAuthentication::Token.token_and_options(request)
    options ||= {}
    user = options[:email] && User.where(email: options[:email]).first
    # When we update to Rails ~4.2.5 use the following:
    # ActiveSupport::SecurityUtils.secure_compare(user.authentication_token, token)
    if user && user.authentication_token == token && UserPolicy.new(user).can_access_api?
      @current_user = user
    else
      return unauthenticated!
    end
  end
  
  def server_error!(error=nil)
    error_message = "#{error.class} (#{error.message})" if error
    respond_to do |format|
      format.json { render json: { errors: [error_message] }, status: :internal_server_error }
    end
  end
  
  def record_not_found!
    respond_to do |format|
      format.json { render json: { errors: ["The object could not be found."] }, status: :not_found}
    end
  end
  
  def unauthenticated!
    respond_to do |format|
      format.json { render json: { errors: ["You are not authorized or authenticated."] }, status: :unauthorized }
    end
  end
  
  def exceeds_api_rate_limit!
    respond_to do |format|
      format.json { render json: { errors: ["You have exceeded the API rate limit."] }, status: :too_many_requests }
    end
  end
  
  def exceeds_api_param_size_limit!
    respond_to do |format|
      format.json { render json: { errors: ["You have supplied a parameter list that is too large."] }, status: :request_entity_too_large }
    end
  end
  
  def destroy_session
    request.session_options[:skip] = true
  end
  
  def log_error(error)
    Rails.logger.error "#{error.class} (#{error})"
    error.backtrace[0..10].each do |backtrace_line|
      next if backtrace_line.include?("/ruby/gems")
      Rails.logger.error "  #{backtrace_line}"
    end
  end
  
end
