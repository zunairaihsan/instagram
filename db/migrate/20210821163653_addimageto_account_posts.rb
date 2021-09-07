class AddimagetoAccountPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :accountposts, :image, :string
  end
end
