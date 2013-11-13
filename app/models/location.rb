class Location < ActiveRecord::Base
  attr_accessible :details, :latitude, :longtitude, :date, :time

  has_many :items

  # MVP: validate existence of location fields
  # We shouldn't require the user to enter details of where the item was lost or found...
  # Thie leaves the following for validation on object creation:
  validates :latitude, :longtitude, :date, :time, presence: true
end
