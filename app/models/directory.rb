class Directory < ActiveRecord::Base
	belongs_to :user
	belongs_to :category

	has_attached_file :directory_img, styles: { :directories_index => "250x350>", :directories_show => "325x475>" }, default_url: "/images/:style/missing.png"
  	validates_attachment_content_type :directory_img, content_type: /\Aimage\/.*\Z/

  	validates_presence_of :first_name
	validates_presence_of :last_name, :email, :presence => true
	validates_presence_of :email, :uniqueness => true

	validates :first_name, length: { :minimum => 3 } 
	validates :last_name, length: { :minimum => 3 }
	validates :title, length: { :minimum => 3 }


	def self.search(search)
		where("first_name LIKE ?", "%#{search}%")
	end

end
