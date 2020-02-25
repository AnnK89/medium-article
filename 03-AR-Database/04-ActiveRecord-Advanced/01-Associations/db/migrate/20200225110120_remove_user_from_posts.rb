class RemoveUserFromPosts < ActiveRecord::Migration[5.2]
  def change
    remove_column :posts, :user
  end
end
