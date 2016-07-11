require 'test_helper'

class ConcertsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get concerts_index_url
    assert_response :success
  end

  test "should get create" do
    get concerts_create_url
    assert_response :success
  end

  test "should get update" do
    get concerts_update_url
    assert_response :success
  end

  test "should get destroy" do
    get concerts_destroy_url
    assert_response :success
  end

end
