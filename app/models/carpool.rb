class Carpool < ActiveRecord::Base
  
  has_many :seats
  belongs_to :user, foreign_key: :created_by
  
  def reserve(user)
    if seats.count < seats_offered
      if Seat.reserve(user, id)
        return true
      end
    end
    false
  end
  
  def seats_remaining
    seats_offered - self.seats.count if seats_offered
  end
  
end
