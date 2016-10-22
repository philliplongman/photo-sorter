# == Schema Information
#
# Table name: tags
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  group_id   :integer
#
# Indexes
#
#  index_tags_on_name  (name) UNIQUE
#

class Tag < ActiveRecord::Base
  belongs_to :group, class_name: TagGroup, foreign_key: :group_id
  has_and_belongs_to_many :photos

  validates :name, presence: true
  validates :name, uniqueness: true

  def self.list
    self.all.map(&:name)
  end
end
