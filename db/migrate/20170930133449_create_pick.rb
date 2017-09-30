class CreatePick < ActiveRecord::Migration[5.1]
  def change
    create_table :picks do |t|
      t.string :url, null: false
      t.text   :memo
      t.string :title
      t.string :content
      t.string :img_url
    end
  end
end
