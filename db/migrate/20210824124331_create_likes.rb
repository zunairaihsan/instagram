class CreateLikes < ActiveRecord::Migration[6.1]
  def change
    create_table :likes do |t|
      t.references :accountpost, null: false, foreign_key: true
      t.references :account, null: false, foreign_key: true
      t.timestamps
    end
  end
end
