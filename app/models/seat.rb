class Seat < ActiveRecord::Base
  
  belongs_to :carpool
  belongs_to :carpoolee, foreign_key: :created_by, class_name: 'User'
  
  def self.reserve(user, carpool)
    return false if where(created_by: user, carpool_id: carpool).count > 0
    seat = new
    seat.created_by = user
    seat.carpool_id = carpool
    seat.save
  end
  
end
