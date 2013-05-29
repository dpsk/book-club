class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :name
      t.string :cover_url
      t.text :notes
      t.string :genre
      t.integer :user_id

      t.timestamps
    end
    add_index :books, :user_id
  end
end
