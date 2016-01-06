require 'test_helper'

class Api::MarkdownControllerTest < ActionController::TestCase
  test "should get render" do
    get :render
    assert_response :success
  end

end
