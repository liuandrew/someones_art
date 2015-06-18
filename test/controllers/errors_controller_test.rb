require 'test_helper'

class ErrorsControllerTest < ActionController::TestCase
  test "should get file_not_found" do
    get :file_not_found
    assert_response :success
  end

end
