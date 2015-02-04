class Attraction < ActiveRecord::Base
 has_attached_file :photo, styles: { thumbnail: "60x60>" }
 validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/
 
    def latitude
 	end	
  
    def longtitude
    end
 
 belongs_to :trip

 # extend Geocoder::Model::ActiveRecord

 # geocoded_by :unique_id
 # after_validation :geocode

 # reverse_geocode_by :latitude, :longitude
 # after_validation :reverse_geocode 
end


