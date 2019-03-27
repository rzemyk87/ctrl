require 'test_helper'

class UzytkowniksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get uzytkowniks_index_url
    assert_response :success
  end

  test "should get nowy" do
    get uzytkowniks_nowy_url
    assert_response :success
  end

  test "should get edycja" do
    get uzytkowniks_edycja_url
    assert_response :success
  end

  test "should get usun" do
    get uzytkowniks_usun_url
    assert_response :success
  end

end
