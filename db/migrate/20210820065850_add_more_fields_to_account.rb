class AddMoreFieldsToAccount < ActiveRecord::Migration[6.1]
  def change
    add_column :accounts, :username, :string
    add_column :accounts, :name, :string
    add_column :accounts, :website, :string
    add_column :accounts, :bio, :text
    add_column :accounts, :phone, :integer
    add_column :accounts, :gender, :string
  end
end
