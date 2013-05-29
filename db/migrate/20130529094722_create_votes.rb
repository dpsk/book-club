class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :book_id
      t.integer :user_id
      t.integer :score

      t.timestamps
    end
    add_index :votes, :book_id
  end
end
