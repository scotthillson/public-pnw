class Search < ActiveRecord::Base
  
  validates_presence_of :author
  validates_presence_of :body
  validates_presence_of :title
  
end
