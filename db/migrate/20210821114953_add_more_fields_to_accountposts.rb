class AddMoreFieldsToAccountposts < ActiveRecord::Migration[6.1]
  def change
    add_column :accountposts, :content, :string
    add_reference :accountposts, :account, null: false, foreign_key: true
  end
end
