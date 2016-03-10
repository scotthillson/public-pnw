class ApplicationController < ActionController::Base
  
  # For APIs, you may want to use :null_session instead?
  protect_from_forgery
  # force_ssl?
  
  helper_method :user_session
  helper_method :admin?
  
  def admin_only
    if !admin?
      redirect_to signin_path
    end
  end
  
  def turn_back
    if !user_session
      redirect_to signin_path
    end
  end
  
  def admin?
    return session[:admin]
  end
  
  def user_session
    session[:user_id]
  end
  
end
