require 'test_helper'

class ServiceControllerTest < ActionController::TestCase
  test "should get item" do
    get :item
    assert_response :success
  end

end
