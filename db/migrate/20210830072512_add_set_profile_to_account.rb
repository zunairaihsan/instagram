class AddSetProfileToAccount < ActiveRecord::Migration[6.1]
  def change
    add_column :accounts, :setprofile, :string
  end
end
