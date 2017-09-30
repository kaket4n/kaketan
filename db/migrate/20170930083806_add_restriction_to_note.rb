class AddRestrictionToNote < ActiveRecord::Migration[5.1]
  def change
    add_column :notes, :restriction, :integer, default: 0
  end
end
