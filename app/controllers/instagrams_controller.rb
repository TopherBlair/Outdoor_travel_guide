class InstagramsController < ApplicationController
  def index
  	@instagram_tag = APP_CONFIG['instagram_hashtag']
  	service_type = "instagram_tag_#{@instagram_tag}"
  	valid_for = 20 # in seconds
  	data = cache_data(service_type, @instagram_tag, valid_for)
  	@instagram_images = JSON.parse(data)['data']

  	respond_to |format|
  		format.html { render :partial => 'index' }
  	end
  end

  private
  def instagram_call instagram_tag
  	in_url = "https://api.instagram.com/v1/tags/#{instagram_tag}/media/recent?client_id=#{APP_CONFIG['instagram_client_id']}"
  	logger.info "Instagram API request: " + in_url
  	http_client = HTTPClient.new
  	return http_client.get_content(in_url)
  end
end
