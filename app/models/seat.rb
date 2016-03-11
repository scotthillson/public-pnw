class Seat < ActiveRecord::Base
  
  belongs_to :carpool
  
  def self.reserve(user, carpool)
    seat = New
    seat.created_by = user
    seat.carpool_id = carpool
    seat.save
  end
  
end
