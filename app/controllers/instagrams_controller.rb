class InstagramsController < ApplicationController
  def attractions_api
    @api_unique_id_results = Apis::Instagram.get_trails_data_id(params['activities_unique_id'])
    @reviews = Review.where(unique_id: params['activities_unique_id'])
  end
end
