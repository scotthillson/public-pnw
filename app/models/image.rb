class Image < ActiveRecord::Base
  validates_presence_of :name
  validates_presence_of :image
end
