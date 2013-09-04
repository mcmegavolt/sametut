require 'test_helper'


class ApplicantsControllerTest < ActionController::TestCase

  test "should get index" do
	  get :index
	  assert_response :success
	  assert_not_nil assigns(:applicants)
	end

end
