class PagesController < ApplicationController
  
  def page
    @page = Page.where(name:params[:page].downcase).last
    @page = @page.body.html_safe if @page
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
    @images = []
    @posts = Post.active
    @carousel_images = Image.banners.shuffle
    @images.push @carousel_images.pop
    @images.push @carousel_images.pop
    @images.push @carousel_images.pop
    @paragraphs = Page.where("name LIKE '%paragraph%'").order(:name)
  end
  
  private
  
  def page_params
    params.require(:page).permit(:name, :created_by, :body)
  end
  
end
