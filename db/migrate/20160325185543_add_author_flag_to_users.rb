class AddAuthorFlagToUsers < ActiveRecord::Migration
  def change
    add_column :users, :author, :boolean, default: false, null: false
  end
end
