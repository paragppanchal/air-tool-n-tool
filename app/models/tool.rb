class Tool < ApplicationRecord
  belongs_to :user
  geocoded_by :address
  has_many :bookings

  after_validation :geocode, if: :will_save_change_to_address?
  mount_uploader :photo, PhotoUploader
end
