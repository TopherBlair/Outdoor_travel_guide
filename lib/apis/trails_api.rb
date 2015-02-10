module Apis
  module TrailsApi
  	include HTTParty # https://github.com/jnunemaker/httparty

  	TRAILS_API_URL = 'https://outdoor-data-api.herokuapp.com/api.json'

  	def self.get_trails_data(city_cont, activities_activity_type_name_eq, options={})
  		options['radius'] = 25 unless options.has_key? 'radius' # Default 25 miles unless otherwise specified
  		options['q'] = {'city_cont' => nil}
  		options['q']['city_cont'] = city_cont
  		options['q']['activities_activity_type_name_eq'] = activities_activity_type_name_eq
      options['api_key'] = ENV['TRAILS_API_KEY']
  		self.headers 'Accept' => 'text/plain'
		puts options
  		self.get(TRAILS_API_URL, :query => options)
  	end

    def self.get_trails_data_id(unique_id, options={})
      options['q'] = {'activities_unique_id_eq' => nil}
      options['q']['activities_unique_id_eq'] = unique_id
      options['api_key'] = ENV['TRAILS_API_KEY']
      self.headers 'Accept' => 'text/plain'
    puts options
      self.get(TRAILS_API_URL, :query => options)
    end

    def self.get_attractions_for_trip

    end

  end
end

  	# See https://www.mashape.com/trailapi/trailapi
  	# Options should have some of these parameters
  	# options = {
  	# 	q: {
  	# 			activities_activity_name_cont: '',
  	# 			activities_activity_type_name_eq: '',
  	# 			city_cont: '', # 
  	# 			state_cont: '',
  	# 			country_cont: ''
  	# 		},
  	# 	radius: 25 # In miles
  	# }