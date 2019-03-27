require 'test_helper'

class StronasControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get stronas_index_url
    assert_response :success
  end

  test "should get pokaz" do
    get stronas_pokaz_url
    assert_response :success
  end

  test "should get nowa" do
    get stronas_nowa_url
    assert_response :success
  end

  test "should get edycja" do
    get stronas_edycja_url
    assert_response :success
  end

  test "should get usun" do
    get stronas_usun_url
    assert_response :success
  end

end
