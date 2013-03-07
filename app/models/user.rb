class User < ActiveRecord::Base
  attr_accessible :name, :password_digest, :email, :role_id, :password, :password_confirmation
  has_secure_password

  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create
  validates_uniqueness_of :email
  validates_presence_of :email

  has_many :posts

  belongs_to :role
end
