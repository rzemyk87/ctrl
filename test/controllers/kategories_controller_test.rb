require 'test_helper'

class KategoriesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get kategories_index_url
    assert_response :success
  end

  test "should get pokaz" do
    get kategories_pokaz_url
    assert_response :success
  end

  test "should get nowa" do
    get kategories_nowa_url
    assert_response :success
  end

  test "should get edycja" do
    get kategories_edycja_url
    assert_response :success
  end

  test "should get usun" do
    get kategories_usun_url
    assert_response :success
  end

end
