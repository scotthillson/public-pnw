class Rental < ActiveRecord::Base
  
  belongs_to :user, foreign_key: :created_by
  belongs_to :claimant, foreign_key: :claimed_by, class_name: 'User'
  
  def reserve(user)
    if !self.claimed_by
      self.claimed_by = user
      if self.save
        return true
      end
    end
    false
  end
  
end
