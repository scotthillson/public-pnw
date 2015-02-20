class Post < ActiveRecord::Base

  validates_presence_of :author
  validates_presence_of :body
  scope :active, -> {where(active: true)}

end
