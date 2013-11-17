class Location < ActiveRecord::Base
  attr_accessible :details, :latitude, :longtitude, :date, :time

  #belongs_to :items
  # has_many :items
  has_one :item

  # MVP: validate existence of location fields
  # We shouldn't require the user to enter details of where the item was lost or found...
  # Thie leaves the following for validation on object creation:
  
  # validates :latitude, :longtitude, :date, :time, presence: true
end
