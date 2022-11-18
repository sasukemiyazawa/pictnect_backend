class RenameIsSafeColumnToPickupPosts < ActiveRecord::Migration[6.0]
  def change
    rename_column :posts, :isSafe, :pickup
  end
end
