class AddLikeCountsToPost < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :likeCounts, :integer
  end
end
