class FoundItem < ActiveRecord::Base
  attr_accessible :category_id, :date, :item_color, :item_details, :location_id, :secret_info, :time, :user_id
end
