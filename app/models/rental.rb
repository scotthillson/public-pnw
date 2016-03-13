class Rental < ActiveRecord::Base
  
  belongs_to :claimant, foreign_key: :claimed_by, class_name: 'User'
  belongs_to :user, foreign_key: :created_by
  validates_presence_of :description
  validates_presence_of :event_date
  validates_presence_of :event
  
  def reserve(user)
    if !self.claimed_by
      self.claimed_by = user
      if self.save
        return true
      end
    end
    false
  end
  
  def destroy_message
    if self.claimed_by.present?
      'Do you really want to delete this? Someone has already asked to borrow it!'
    else
      'Are you sure you want to take the offer down?'
    end
  end
  
end
