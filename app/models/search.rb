# A search is a pnwsar.org public facing representation of D4H incidents.

class Search < ActiveRecord::Base
  
  validates_presence_of :author
  validates_presence_of :body
  validates_presence_of :title
  
end
