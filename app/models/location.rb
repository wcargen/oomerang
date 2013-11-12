class Location < ActiveRecord::Base
  attr_accessible :address, :latitude, :longtitude, :placename
end
