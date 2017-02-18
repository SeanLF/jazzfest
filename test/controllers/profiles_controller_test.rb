require 'test_helper'

class ProfilesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @profile = profiles(:one)
  end

  test "should get index" do
    get profiles_url
    assert_response :success
  end

  test "should get new" do
    get new_profile_url
    assert_response :success
  end

  test "should create profile" do
    assert_difference('Profile.count') do
      post profiles_url, params: { profile: { address: @profile.address, age_group: @profile.age_group, auth0_id: @profile.auth0_id, cell_phone_number: @profile.cell_phone_number, city: @profile.city, code_of_conduct: @profile.code_of_conduct, email: @profile.email, emergency_contact_name: @profile.emergency_contact_name, emergency_contact_number: @profile.emergency_contact_number, first_name: @profile.first_name, home_phone_number: @profile.home_phone_number, last_name: @profile.last_name, notes: @profile.notes, postal_code: @profile.postal_code, province: @profile.province, t_shirt_size: @profile.t_shirt_size, work_phone_number: @profile.work_phone_number } }
    end

    assert_redirected_to profile_url(Profile.last)
  end

  test "should show profile" do
    get profile_url(@profile)
    assert_response :success
  end

  test "should get edit" do
    get edit_profile_url(@profile)
    assert_response :success
  end

  test "should update profile" do
    patch profile_url(@profile), params: { profile: { address: @profile.address, age_group: @profile.age_group, auth0_id: @profile.auth0_id, cell_phone_number: @profile.cell_phone_number, city: @profile.city, code_of_conduct: @profile.code_of_conduct, email: @profile.email, emergency_contact_name: @profile.emergency_contact_name, emergency_contact_number: @profile.emergency_contact_number, first_name: @profile.first_name, home_phone_number: @profile.home_phone_number, last_name: @profile.last_name, notes: @profile.notes, postal_code: @profile.postal_code, province: @profile.province, t_shirt_size: @profile.t_shirt_size, work_phone_number: @profile.work_phone_number } }
    assert_redirected_to profile_url(@profile)
  end

  test "should destroy profile" do
    assert_difference('Profile.count', -1) do
      delete profile_url(@profile)
    end

    assert_redirected_to profiles_url
  end
end
