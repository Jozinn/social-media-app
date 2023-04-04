class FriendsTable < ActiveRecord::Migration[7.0]
  def change
    create_table :users_friends, id: false do |t|
      t.bigint :this_user_id
      t.bigint :other_user_id
    end

    add_index :users_friends, :this_user_id
    add_index :users_friends, :other_user_id
  end
end
