class SearchesController < ApplicationController
  
  before_action :admin_only, only: [:new, :edit, :update, :destroy]
  before_action :set_search, only: [:show, :edit, :update, :destroy]
  
  def index
    @searches = Search.all.order(:search_date).reverse
  end
  
  def show
  end
  
  def new
    @search = Search.new
  end
  
  def edit
  end
  
  def create
    @search = Search.new(search_params)
    if @search.save
      redirect_to @search, notice: 'Search was successfully created.'
    else
      render :new
    end
  end
  
  def update
    if @search.update(search_params)
      redirect_to @search, notice: 'Search was successfully updated.'
    else
      render :edit
    end
  end
  
  def destroy
    @search.destroy
    redirect_to searches_url, notice: 'Search was successfully destroyed.'
  end
  
  private
  
  def set_search
    @search = Search.find(params[:id])
  end
  
  def search_params
    params.require(:search).permit(:title, :author, :body, :search_date)
  end
  
end
