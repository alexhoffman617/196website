class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.belongs_to :user
      t.belongs_to :post

      t.timestamps
    end
    add_index :votes, :user_id
    add_index :votes, :post_id
  end
end
