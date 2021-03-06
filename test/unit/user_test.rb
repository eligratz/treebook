require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "a user should enter a first name" do
  	user = User.new
  	assert !user.save
  	assert !user.errors[:first_name].empty?
  end


  test "a user should enter a last name" do
  	user = User.new
  	assert !user.save
  	assert !user.errors[:last_name].empty?
  end

    test "a user should enter a profile name" do
  	user = User.new
  	assert !user.save
  	assert !user.errors[:profile_name].empty?
  end

  test "a user should have a unique profile name" do
  	user = User.new
  	user.profile_name = users(:eli).profile_name


  	users(:eli)

  	assert !user.save
  	assert !user.errors[:profile_name].empty?
  end

  test "a user should have a profile name without spaces" do
  
  user = User.new(first_name: 'Eli', last_name: 'Gratz', email:'ergartz2@gmail.com')
  user.password = user.password_confirmation = 'asdfasdf'

  	user.profile_name = "My profile With Spaces"

  	assert !user.save
  	assert !user.errors[:profile_name].empty?
  	assert user.errors[:profile_name].include?("Must be formatted correctly.")
  end


test "a user can have a correctly formatted profile name" do
  user = User.new(first_name: 'Eli', last_name: 'Gratz', email:'ergartz2@gmail.com')
  user.password = user.password_confirmation = 'asdfasdf'

  user.profile_name = 'eligratz_1'
  assert user.valid?
end
end










