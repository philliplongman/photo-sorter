class TagGroup < ActiveRecord::Base
  has_many :tags, foreign_key: :group_id
end
