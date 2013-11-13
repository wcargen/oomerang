class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :username

  has_many :found_items, class_name: 'Item', :foreign_key => 'finder_id', inverse_of: :finder
  has_many :lost_items,  class_name: 'Item', :foreign_key => 'seeker_id', inverse_of: :seeker

  # MVP: validate existence of user fields
  validates :name, :email, :username, :password, presence: true
end
