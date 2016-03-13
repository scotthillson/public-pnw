class Discussion < ActiveRecord::Base
  
  has_many :comments
  belongs_to :author, foreign_key: :created_by, class: 'User'
  
end
