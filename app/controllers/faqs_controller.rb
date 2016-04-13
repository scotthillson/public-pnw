class FaqsController < ApplicationController
  
  before_action :advanced_only, only: [:new, :edit, :update, :destroy]
  before_action :set_faq, only: [:show, :edit, :update, :destroy]
  
  def index
    @page = Page.where(name:'faqs').order(:created_at).last.body.html_safe
  end
  
  def new
  end
  
  def create
  end
  
  def destroy
  end
  
  def set_faq
  end
  
end
