require 'test_helper'


class SchoolsControllerTest < ActionController::TestCase

  test "should get index" do
	  get :index
	  assert_response :success
	  assert_not_nil assigns(:schools)
	end

end
