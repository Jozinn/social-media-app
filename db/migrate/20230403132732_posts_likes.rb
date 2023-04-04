class PostsLikes < ActiveRecord::Migration[7.0]
  def change
    change_table :posts do |t|
      t.integer :likes
    end
  end
end
