class CreateInvitations < ActiveRecord::Migration[7.0]
  def change
    create_table :invitations do |t|
      t.boolean :accepted
      t.belongs_to :invited_user, foreign_key: true
      t.belongs_to :inviting_user, foreign_key: true
      t.timestamps
    end
  end
end
