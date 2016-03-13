class Discussion < ActiveRecord::Base
  
  has_many :comments
  belongs_to :author, foreign_key: :created_by, class_name: 'User'
  validates_presence_of :body
  validates_presence_of :subject
  
end
