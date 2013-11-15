class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :name, :password, :password_confirmation, :remember_me, :username

  has_many :found_items, class_name: 'Item', :foreign_key => 'finder_id', inverse_of: :finder
  has_many :lost_items,  class_name: 'Item', :foreign_key => 'seeker_id', inverse_of: :seeker

  # MVP: validate existence of user fields
  validates :name, :email, :username, :password, presence: true
end
