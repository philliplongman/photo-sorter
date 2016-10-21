# == Schema Information
#
# Table name: photos
#
#  id         :integer          not null, primary key
#  path       :string           not null
#  tagged_at  :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_photos_on_path  (path) UNIQUE
#

class Photo < ActiveRecord::Base
  has_and_belongs_to_many :tags

  validates :path, presence: true
  validates :path, uniqueness: true
end
