# == Schema Information
#
# Table name: photos
#
#  id         :integer          not null, primary key
#  path       :text             not null
#  tagged_at  :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_photos_on_path  (path) UNIQUE
#

class Photo < ActiveRecord::Base
  scope :random_order, -> { order("RANDOM()") }

  has_and_belongs_to_many :tags

  validates :path, presence: true
  validates :path, uniqueness: true

  def asset_path
    "photo_library/#{filename}"
  end

  def filename
    File.basename(path)
  end
end
