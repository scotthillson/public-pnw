class Comment < ActiveRecord::Base
  
  belongs_to :discussion
  belongs_to :author, foreign_key: :created_by, class: 'User'
  
end
