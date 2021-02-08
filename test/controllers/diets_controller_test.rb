require 'test_helper'

class DietsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get diets_index_url
    assert_response :success
  end

end
