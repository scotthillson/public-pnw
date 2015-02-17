class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_email(params[:email].downcase)
    if user && user.authenticate(params[:password])
    	session[:user_id] = user.id
      session[:admin] = user.admin
    	session[:user_email] = user.email
      redirect_to root_path, notice: 'logged in'
    else
    	redirect_to signin_path(email: params[:email]), notice: 'sorry, but those credentials don\'t stack up'
    end
  end

  def destroy
    session[:admin] = nil
  	session[:user_id] = nil
  	session[:user_email] = nil
  	redirect_to signin_path, notice: 'logged out!'
  end

end