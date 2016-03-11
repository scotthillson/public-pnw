class Carpool < ActiveRecord::Base
  
  has_many :seats
  
  def reserve(user)
    if seats < seats_offered
      if Seat.reserve(user, id)
        return true
      end
    end
    false
  end
  
end
