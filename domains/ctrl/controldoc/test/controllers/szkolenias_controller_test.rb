require 'test_helper'

class SzkoleniasControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get szkolenias_index_url
    assert_response :success
  end

  test "should get robotnicze" do
    get szkolenias_robotnicze_url
    assert_response :success
  end

  test "should get biurowe" do
    get szkolenias_biurowe_url
    assert_response :success
  end

  test "should get pracodawcow" do
    get szkolenias_pracodawcow_url
    assert_response :success
  end

  test "should get inzynieryjne" do
    get szkolenias_inzynieryjne_url
    assert_response :success
  end

end
