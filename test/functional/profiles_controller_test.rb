require 'test_helper'

class ProfilesControllerTest < ActionController::TestCase
  test "should get show" do
    get :show, id: users(:eli).profile_name #added the id: part to bring in the user Id from the user in the fixtures
    assert_response :success
    assert_template 'profiles/show'
  end

test "should render a 404 on profile not found " do

	get :show, id: "doesn't exist"
	assert_response :not_found
end

test "that variables are assigned on succesful profile viewing" do
	get :show, id: users(:eli).profile_name 
	assert assigns(:user)
	assert_not_empty assigns(:statuses)
end

test "only correct status is shown on a user" do #this is scoping video inputs
	get :show, id: users(:eli).profile_name
	assigns(:statuses).each do |status|
		assert_equal users(:eli), status.user
	end
end


end


