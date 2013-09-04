require 'test_helper'

class VacanciesControllerTest < ActionController::TestCase
  
  test "should get index" do
	  get :index
	  assert_response :success
	  # assert_not_nil assigns(:vacancies)
	end

end
