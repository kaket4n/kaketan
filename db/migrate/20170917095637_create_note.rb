class CreateNote < ActiveRecord::Migration[5.1]
  def change
    create_table :notes do |t|
      t.integer :category_id
      t.string :title
      t.text :content

      t.timestamps null: false
    end

    add_index :notes, :category_id
  end
end
