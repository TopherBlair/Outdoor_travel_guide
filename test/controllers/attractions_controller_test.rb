require 'test_helper'

class AttractionsControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  test "should get show" do
    get :show, id: attractions(:one)
    assert_response :success
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get new" do
    @user = User.create!({:email => "yayaya@email.com", :password => "password", :password_confirmation => "password"})
      sign_in @user
    get :new
    assert_response :success
  end

  test "should get create" do
    get :create
    assert_response :success
  end

  test "should get edit" do
    @user = User.create!({:email => "yayaya@email.com", :password => "password", :password_confirmation => "password"})
      sign_in @user
    get :edit, id: attractions(:one)
    assert_response :success
  end

  # test "should get update" do
  #   get :update
  #   assert_response :success
  # end

  # test "should get destroy" do
  #   get :destroy
  #   assert_response :success
  # end

end
