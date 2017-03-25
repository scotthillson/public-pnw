class Equipment < ActiveRecord::Base

  validates_presence_of :name

  scope :team, -> { where("importance is not 'Personal'") }

end
