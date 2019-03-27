require 'test_helper'

class KursesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get kurses_index_url
    assert_response :success
  end

  test "should get edycja" do
    get kurses_edycja_url
    assert_response :success
  end

  test "should get usun" do
    get kurses_usun_url
    assert_response :success
  end

end
