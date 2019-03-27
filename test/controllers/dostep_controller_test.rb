require 'test_helper'

class DostepControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get dostep_index_url
    assert_response :success
  end

  test "should get login" do
    get dostep_login_url
    assert_response :success
  end

end
