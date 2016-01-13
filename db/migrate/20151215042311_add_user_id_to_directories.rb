class AddUserIdToDirectories < ActiveRecord::Migration
  def change
    add_column :directories, :user_id, :integer
  end
end
