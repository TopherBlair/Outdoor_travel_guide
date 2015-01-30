module Apis
  module Instagram
  	include HTTParty # https://github.com/jnunemaker/httparty

  	def self.instagram_call(instagram_tag)
	  	in_url = "https://api.instagram.com/v1/tags/#{instagram_tag}/media/recent?access_token=#{ENV['IG_ACCESS_TOKEN']}"
	  	puts in_url
	  	self.get(in_url)
	  end

  end
end
