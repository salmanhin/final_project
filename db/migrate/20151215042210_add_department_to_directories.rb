class AddDepartmentToDirectories < ActiveRecord::Migration
  def change
    add_column :directories, :department, :string
  end
end
