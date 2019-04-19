require 'test_helper'

class FirmaControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get firma_index_url
    assert_response :success
  end

end
