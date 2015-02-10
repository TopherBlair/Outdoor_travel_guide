require 'test_helper'

class ReviewsControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  # test "should get index" do
  #   get :index
  #   assert_response :success
  # end

  # test "should get show" do
  #   get :show
  #   assert_response :success
  # end

  test "should get new" do
    @user = User.create!({:email => "yayaya@email.com", :password => "password", :password_confirmation => "password"})
    sign_in @user
    get :new
    assert_response :success
  end

end
