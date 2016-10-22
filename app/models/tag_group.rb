# == Schema Information
#
# Table name: tag_groups
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_tag_groups_on_name  (name) UNIQUE
#

class TagGroup < ActiveRecord::Base
  has_many :tags, foreign_key: :group_id
end
