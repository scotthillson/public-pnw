class PagesController < ApplicationController
  
  before_action :admin_only, only: [:new, :edit, :update, :destroy]
  
  def page
    @page = Page.where(name:params[:page].downcase).last
    if @page
      @page = @page.body.html_safe
    else
      redirect_to '/404'
    end
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
    @carousel_images = Image.banners
    @images.push @carousel_images.pop
    @images.push @carousel_images.pop
    @images.push @carousel_images.pop
    @paragraphs = []
    @paragraphs[0] = Page.where(name: 'paragraph one').last
    @paragraphs[1] = Page.where(name: 'paragraph two').last
    @paragraphs[2] = Page.where(name: 'paragraph three').last
    @paragraphs[3] = Page.where(name: 'paragraph four').last
  end
  
  private
  
  def page_params
    params.require(:page).permit(:name, :created_by, :body)
  end
  
end
