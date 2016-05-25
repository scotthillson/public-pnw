class Carpool < ActiveRecord::Base
  
  has_many :seats
  belongs_to :user, foreign_key: :created_by
  validates_presence_of :address
  validates_presence_of :event_date
  validates_presence_of :depart
  validates_presence_of :return
  
  def reserve(user)
    if seats_are_still_available
      Seat.reserve(user, id)
    else
      false
    end
  end
  
  def number_of_seats_taken
    seats.count
  end
  
  def seats_are_still_available
    number_of_seats_taken < seats_offered
  end
  
  def seats_remaining
    seats_offered - seats.count if seats_offered
  end
  
  def some_seats_are_taken
    number_of_seats_taken > 0
  end
  
  def destroy_message
    if some_seats_are_taken
      'Do you really want to cancel??'
    else
      'Are you sure you want to cancel this carpool?'
    end
  end
  
end
