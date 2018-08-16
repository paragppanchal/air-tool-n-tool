class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :tools
  has_many :bookings
  has_many :outbound_bookings, class_name: :Booking, through: :tools, source: :bookings
end
