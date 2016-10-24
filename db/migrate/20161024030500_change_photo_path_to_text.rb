class ChangePhotoPathToText < ActiveRecord::Migration[5.0]
  def up
    change_column :photos, :path, :text, null: false
  end

  def down
    change_column :photos, :path, :string, null: false
  end
end
