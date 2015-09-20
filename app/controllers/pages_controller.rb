class PagesController < ApplicationController

  after_action :just_body, only: [:about,:contact,:donate,:donate_vehicle,:faqs,:join,:meetings,:sponsors]

  def index
  end

  def show
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
    @page = @page.body.html_safe if @page
  end

  def contact
    @page = Page.where(name:'Contact').last
  end

  def donate
    @page = Page.where(name:'Donate').last
  end

  def donate_vehicle
    @page = Page.where(name:'Donate Vehicle').last
  end

  def faqs
    @page = Page.where(name:'faqs').last
  end

  def join
    @page = Page.where(name:'Join').last
  end

  def meetings
    @page = Page.where(name:'Meetings').last
  end

  def sponsors
    @page = Page.where(name:'Sponsors').last
  end

  private

  def just_body
    #@page = @page.body.html_safe if @page
  end

  def page_params
    params.require(:page).permit(:name, :created_by, :body)
  end

end
