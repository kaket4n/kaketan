class Comments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.integer :diary_id, null: false

      t.timestamps precision: 6
    end

    add_index :comments, :diary_id
  end
end
