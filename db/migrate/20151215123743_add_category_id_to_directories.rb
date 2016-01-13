class AddCategoryIdToDirectories < ActiveRecord::Migration
  def change
    add_column :directories, :category_id, :integer
  end
end
