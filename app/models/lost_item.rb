class LostItem < ActiveRecord::Base
  attr_accessible :category_id, :date, :item_color, :item_details, :location_id, :time, :user_id
end
