class DropExtraTableSearch < ActiveRecord::Migration[6.1]
  def change
    drop_table :search
  end
end
