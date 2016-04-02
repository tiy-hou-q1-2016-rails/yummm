require "test_helper"

class ChartsControllerTest < ActionController::TestCase
  def test_show
    get :show
    assert_response :success
  end

end
