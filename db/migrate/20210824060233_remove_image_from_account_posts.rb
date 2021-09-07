class RemoveImageFromAccountPosts < ActiveRecord::Migration[6.1]
  def change
    remove_column :accountposts, :image, :string
  end
end
