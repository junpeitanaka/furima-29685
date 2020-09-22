require 'test_helper'

class LooksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get looks_index_url
    assert_response :success
  end

end
