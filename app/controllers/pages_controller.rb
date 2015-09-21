class PagesController < ApplicationController

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

  def about
    @page = Page.where(name:'About').last
    just_body
  end

  def contact
    @page = Page.where(name:'Contact').last
    just_body
  end

  def donate
    @page = Page.where(name:'Donate').last
    just_body
  end

  def donate_vehicle
    @page = Page.where(name:'Donate Vehicle').last
    just_body
  end

  def faqs
    @page = Page.where(name:'faqs').last
    just_body
  end

  def join
    @page = Page.where(name:'Join').last
    just_body
  end

  def meetings
    @page = Page.where(name:'Meetings').last
    just_body
  end

  def sponsors
    @page = Page.where(name:'Sponsors').last
    just_body
  end

  private

  def just_body
    @page = @page.body.html_safe if @page
  end

  def page_params
    params.require(:page).permit(:name, :created_by, :body)
  end

end
