require 'test_helper'


class DepartmentsControllerTest < ActionController::TestCase

  test "should get index" do
	  get :index
	  assert_response :success
	  assert_not_nil assigns(:departments)
	end

end
