class CreateAccountposts < ActiveRecord::Migration[6.1]
  def change
    create_table :accountposts do |t|
      t.timestamps
    end
  end
end
