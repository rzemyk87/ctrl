require 'test_helper'

class PublicControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_index_url
    assert_response :success
  end

  test "should get artykuly" do
    get public_artykuly_url
    assert_response :success
  end

  test "should get galerie" do
    get public_galerie_url
    assert_response :success
  end

  test "should get kategorie" do
    get public_kategorie_url
    assert_response :success
  end

  test "should get nowosci" do
    get public_nowosci_url
    assert_response :success
  end

  test "should get strona" do
    get public_strona_url
    assert_response :success
  end

end
