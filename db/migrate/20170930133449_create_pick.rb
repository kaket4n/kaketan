class CreatePick < ActiveRecord::Migration[5.1]
  def change
    create_table :picks do |t|
      t.string :url, null: false
      t.text   :memo
      t.string :title
      t.text   :description
      t.string :img_url

      t.timestamps null: false
    end
  end
end
