class Carpool < ActiveRecord::Base
  
  has_many :seats
  belongs_to :user, foreign_key: :created_by
  validates_presence_of :address
  validates_presence_of :event_date
  validates_presence_of :depart
  validates_presence_of :return
  
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
  
  def destroy_message
    if self.seats.count > 0
      'Do you really want to cancel??'
    else
      'Are you sure you want to cancel this carpool?'
    end
  end
  
end
