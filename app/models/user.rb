class User < ActiveRecord::Base
  include Clearance::User

  validates :email, email: { strict_mode: true }
  validates :name, presence: true
  validates :password, presence: true

  has_one :account
end
