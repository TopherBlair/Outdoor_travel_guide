class Review < ActiveRecord::Base
   belongs_to :user
   has_attached_file :photo, styles: { thumbnail: "50x50>" },
	   :url	=> "/assets/reviews/:id/:style/:basename.:extenstion",
	   :path => ":rails_root/public/assets/reviews/:id/:style/:basename.:extention"
    validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/
end


