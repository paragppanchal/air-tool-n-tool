class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :tool
  mount_uploader :photo, PhotoUploader
end
