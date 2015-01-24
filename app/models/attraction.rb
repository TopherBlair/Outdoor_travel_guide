class Attraction < ActiveRecord::Base
     has_attached_file :photo, styles: { thumbnail: "60x60>" }
     validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/

     def latitude
     end	
    

     def longtitude
     end

    end
end


