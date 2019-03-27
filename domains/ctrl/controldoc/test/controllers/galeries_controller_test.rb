require 'test_helper'

class GaleriesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get galeries_index_url
    assert_response :success
  end

  test "should get nowa" do
    get galeries_nowa_url
    assert_response :success
  end

  test "should get pokaz" do
    get galeries_pokaz_url
    assert_response :success
  end

  test "should get edycja" do
    get galeries_edycja_url
    assert_response :success
  end

  test "should get usun" do
    get galeries_usun_url
    assert_response :success
  end

end
