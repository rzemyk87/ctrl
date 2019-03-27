require 'test_helper'

class ZdjeciesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get zdjecies_index_url
    assert_response :success
  end

  test "should get nowa" do
    get zdjecies_nowa_url
    assert_response :success
  end

  test "should get pokaz" do
    get zdjecies_pokaz_url
    assert_response :success
  end

  test "should get edycja" do
    get zdjecies_edycja_url
    assert_response :success
  end

  test "should get usun" do
    get zdjecies_usun_url
    assert_response :success
  end

end
