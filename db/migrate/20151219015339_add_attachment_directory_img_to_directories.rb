class AddAttachmentDirectoryImgToDirectories < ActiveRecord::Migration
  def self.up
    change_table :directories do |t|
      t.attachment :directory_img
    end
  end

  def self.down
    remove_attachment :directories, :directory_img
  end
end
