class RenameNoteToDiary < ActiveRecord::Migration[5.1]
  def change
    rename_table :notes, :diaries
  end
end
