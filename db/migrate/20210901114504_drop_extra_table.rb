class DropExtraTable < ActiveRecord::Migration[6.1]
  def change
    drop_table :likes
    drop_table :searches
  end
end
