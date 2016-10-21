class CreateTags < ActiveRecord::Migration[5.0]
  def change
    create_table :tags do |t|
      t.string :name, null: false
      t.timestamps
    end

    add_index :tags, :name, unique: true

    create_table :photos_tags do |t|
      t.integer :photo_id
      t.integer :tag_id
    end
  end
end
