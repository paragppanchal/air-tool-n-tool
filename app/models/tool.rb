class Tool < ApplicationRecord
  belongs_to :user
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  mount_uploader :photo, PhotoUploader
  include PgSearch
  pg_search_scope :search_by_title_and_syllabus, against: [ :title, :syllabus ]
end
