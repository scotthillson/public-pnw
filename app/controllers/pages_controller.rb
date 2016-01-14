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
    @paragraph_one = Page.where(name:'paragraph one').last
    @paragraph_one = @paragraph_one.body if @paragraph_one
    @paragraph_two = Page.where(name:'paragraph two').last
    @paragraph_two = @paragraph_two.body if @paragraph_two
    @paragraph_three = Page.where(name:'paragraph three').last
    @paragraph_three = @paragraph_three.body if @paragraph_three
    @paragraph_four = Page.where(name:'paragraph four').last
    @paragraph_four = @paragraph_four.body if @paragraph_four
  end

  private

  def page_params
    params.require(:page).permit(:name, :created_by, :body)
  end

end
