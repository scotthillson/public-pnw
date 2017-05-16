class Location < ActiveRecord::Base

  def self.create_with_token(params)
    user = User.find_by_token(params[:token])
    return false unless user
    store_location(OpenStruct.new(params), user.id)
  end

  def self.store_location(l, user_id)
    create(
      user_id: user_id,
      horizon_accuracy: l.horizon_accuracy,
      vert_accuracy: l.vert_accuracy,
      #reported_at: DateTime.strptime(l.time),
      altitude: l.alt,
      course: l.course,
      speed: l.speed,
      lat: l.lat,
      lng: l.lng
    )
  end

end
