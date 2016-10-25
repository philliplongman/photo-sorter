class AddFilenameToPhotos < ActiveRecord::Migration[5.0]
  def change
    add_column :photos, :filename, :text
  end
end
