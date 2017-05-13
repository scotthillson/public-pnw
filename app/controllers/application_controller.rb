class ApplicationController < ActionController::Base

  protect_from_forgery
  # force_ssl = true

  helper_method :current_user
  helper_method :advanced?
  helper_method :admin?

  def admin_only
    unless admin?
      redirect_to root_path
    end
  end

  def advanced_only
    unless advanced?
      redirect_to root_path
    end
  end

  def turn_back
    unless current_user
      redirect_to signin_path
    end
  end

  def valid_api_token
    params[:access_token] == Rails.application.secrets.api_admin
  end

  def admin?
    session[:role] == 'admin'
  end

  def advanced?
    session[:role] == 'advanced' || admin?
  end

  def current_user
    session[:user_id]
  end

end
