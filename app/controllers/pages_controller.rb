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
    @images = []
    @paragraphs = Page.where("name LIKE '%paragraph%'").order(:name)
    @carousel_images = Image.where(type:'carousel').order(:rank)
  end
  
  private
  
  def page_params
    params.require(:page).permit(:name, :created_by, :body)
  end
  
end
