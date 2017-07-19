class Equipment < ActiveRecord::Base

  scope :team, -> { where("importance is not 'Personal'") }

end
