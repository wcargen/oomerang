class Item < ActiveRecord::Base
  attr_accessible :category_id, :color, :details, :finder_id, :location_id, :secret_info, :seeker_id, :status, :title

  belongs_to :seeker, class_name: 'User', inverse_of: :found_items
  belongs_to :finder, class_name: 'User', inverse_of: :lost_items
  # has_one :location
  # has_one :category
  belongs_to :location
  belongs_to :category

  # MVP: validate existence of initial fields only:
  # One of :seeker_id or :finder_id will exist - won't know which one posts item first, or if the other will ever respond
  # Won't know if there will be a seeker requesting return from a finder, to enter the requested :secret_info
  # We shouldn't require that they provide: :color, :details
  # This leaves only the following validatable scope at object creation...
  
  # validates :category_id, :location_id, :status, presence: true

end
