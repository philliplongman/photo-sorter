# == Schema Information
#
# Table name: photos
#
#  id         :integer          not null, primary key
#  path       :text             not null
#  tagged_at  :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  filename   :text
#
# Indexes
#
#  index_photos_on_path  (path) UNIQUE
#

class Photo < ActiveRecord::Base
  scope :random_order, -> { order("RANDOM()") }
  scope :tagged, -> (tag) { includes(:tags).where(tags: { name: tag }) }

  has_and_belongs_to_many :tags

  validates :path, presence: true
  validates :path, uniqueness: true

  before_create -> (){ self.filename = File.basename(self.path) }

  def asset_path
    "photo_library/#{filename}"
  end
end
