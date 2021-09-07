class AddLocationToAccount < ActiveRecord::Migration[6.1]
  def change
    add_column :accounts, :location, :string
  end
end
