class AddFieldsToBooks < ActiveRecord::Migration
  def change
    add_column :books, :reputation, :integer, default: 0
    add_column :books, :featured, :boolean, default: false
  end
end
