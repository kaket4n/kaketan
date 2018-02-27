class AddColumnsToComment < ActiveRecord::Migration[5.1]
  def change
    add_column :comments, :user_id, :integer, after: :diary_id
    add_column :comments, :content, :text, after: :user_id
  end
end
