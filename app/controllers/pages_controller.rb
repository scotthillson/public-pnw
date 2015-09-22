class PagesController < ApplicationController

  def page
    @page = Page.where(name:params[:page]).last.body.html_safe
  end

  def index
  end

  def last_version
    render json: Page.where(name:params[:name]).last
  end

  def new
    @page = Page.new
  end

  def create
    @page = Page.new(page_params)
    @page.save
    redirect_to new_page_path
  end

  def approve
  end

  def destroy
  end

  def home
    @posts = Post.active
    @paragraph_one = Page.where(name:'Paragraph One').last.body
    @paragraph_two = Page.where(name:'Paragraph Two').last.body
    @paragraph_three = Page.where(name:'Paragraph Three').last.body
    @paragraph_four = Page.where(name:'Paragraph Four').last.body
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
