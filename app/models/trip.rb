class Trip < ActiveRecord::Base
  has_many :attractions
  belongs_to :user
	# attr_accessible :name, :price, :release_on

	# def self.to_csv
	# 	CSV.generate do |csv|
	# 		csv << column_names
	# 		all.each do |trip|
	# 			csv << trip.attributes.values_at(*column_names)
	# 		end
	# 	end
	# end
end
