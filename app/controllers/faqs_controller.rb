class FaqsController < ApplicationController

  def index
    @page = Page.where(name:'faqs').order(:created_at).last.body.html_safe
  end

end
