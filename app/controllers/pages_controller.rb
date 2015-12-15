class PagesController < ApplicationController

  def page
    @page = Page.where(name:params[:page].downcase).last.body.html_safe
  end

  def index
  end

  def last_version
    render json: Page.where(name:params[:name].downcase).last
  end

  def new
    @page = Page.new
  end

  def create
    @page = Page.new(page_params)
    @page.name = @page.name.downcase
    @page.save
    redirect_to new_page_path
  end

  def approve
  end

  def destroy
  end

  def home
    @posts = Post.active
    @paragraph_one = Page.where(name:'paragraph one').last.body
    @paragraph_two = Page.where(name:'paragraph two').last.body
    @paragraph_three = Page.where(name:'paragraph three').last.body
    @paragraph_four = Page.where(name:'paragraph four').last.body
  end

  def about
  end

  def contact
  end

  def donate
  end

  def donate_vehicle
  end

  def faqs
  end

  def join
  end

  def meetings
  end

  def sponsors
  end

  private

  def page_params
    params.require(:page).permit(:name, :created_by, :body)
  end

end
