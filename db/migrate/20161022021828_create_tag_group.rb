class CreateTagGroup < ActiveRecord::Migration[5.0]
  def change
    create_table :tag_groups do |t|
      t.string :name, null: false
      t.timestamps
    end

    add_index :tag_groups, :name, unique: true

    add_column :tags, :group_id, :integer
  end
end
