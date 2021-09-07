class Search < ActiveRecord::Migration[6.1]
  def change
    create_table :Search do |t|
     
      t.references :accounts, null: false, foreign_key: true

      t.timestamps
    end
  end
end
