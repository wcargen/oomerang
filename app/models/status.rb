class Status < ActiveRecord::Base
  attr_accessible :finder_user_id, :found_item_id, :lost_item_id, :seeker_user_id, :status
end
