class CreatePhotos < ActiveRecord::Migration[5.0]
  def change
    create_table :photos do |t|
      t.string :path, null: false
      t.datetime :tagged_at

      t.timestamps
    end

    add_index :photos, :path, unique: true
  end
end
