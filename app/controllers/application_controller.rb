class ApplicationController < ActionController::Base

  # For APIs, you may want to use :null_session instead?
  protect_from_forgery
  # force_ssl

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
