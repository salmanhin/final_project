class AddEmailToDirectories < ActiveRecord::Migration
  def change
    add_column :directories, :email, :string
  end
end
