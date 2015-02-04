class Review < ActiveRecord::Base
   belongs_to :user
   has_attached_file :photo, styles: { thumbnail: "50x50>" }
   validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/
end


