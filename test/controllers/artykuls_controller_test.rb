require 'test_helper'

class ArtykulsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get artykuls_index_url
    assert_response :success
  end

  test "should get nowy" do
    get artykuls_nowy_url
    assert_response :success
  end

  test "should get edycja" do
    get artykuls_edycja_url
    assert_response :success
  end

  test "should get usun" do
    get artykuls_usun_url
    assert_response :success
  end

  test "should get pokaz" do
    get artykuls_pokaz_url
    assert_response :success
  end

end
