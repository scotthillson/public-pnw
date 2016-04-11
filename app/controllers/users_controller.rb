class UsersController < ApplicationController
  
  before_action :admin_only, only: [:index, :new, :create, :edit, :destroy]
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :digest_token, only: :begin_signup
  
  def index
    @users = User.all
  end
  
  def show
    redirect_to '/404'
  end
  
  def begin_signup
    if !@user
      not_found
    end
  end
  
  def digest_token
    if user_session
      redirect_to root_path, notice: 'You can\'t sign up if you\'re already signed in...'
    else
      @user = User.find_by_token params[:token]
    end
  end
  
  def set_password
    if params[:user][:password].length < 8
      flash[:notice] = 'Minimum password length is 8'
      render :begin_signup
      return
    end
    if params[:user][:password] != params[:user][:password_confirmation]
      flash[:notice] = 'We must insist that your passwords match'
      render :begin_signup
      return
    end
    @user.update(user_params)
    if @user.set_password
      redirect_to signin_path
    else
      render :begin_signup
    end
  end
  
  def forgot_password
  end
  
  def password_email
    @user = User.find_by_email params[:email]
    if !@user
      redirect_to signin_url
      return
    end
    @user.refresh
    if current_user
      redirect_to users_url
    else
      redirect_to signin_url, notice: 'We sent you an email with further instructions and we await your return.'
    end
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.refresh
      if @user.save
        redirect_to users_url, notice: 'User was successfully created'
      else
        render :new
      end
    else
      render :new
    end
  end
  
  def edit
  end
  
  def update
    if @user.update(user_params)
      redirect_to users_url, notice: 'User was successfully updated'
    else
      render :edit
    end
  end
  
  def destroy
    if @user.destroy
      redirect_to users_url, notice: 'User was successfully destroyed.'
    else
      redirect_to users_url, notice: 'Something didn\'t work?'
    end
  end
  
  private
  
  def set_user
    @user = User.find(params[:id])
  end
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  
end
