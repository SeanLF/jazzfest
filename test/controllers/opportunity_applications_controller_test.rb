require 'test_helper'

class OpportunityApplicationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @opportunity_application = opportunity_applications(:one)
  end

  test "should get index" do
    get opportunity_applications_url
    assert_response :success
  end

  test "should get new" do
    get new_opportunity_application_url
    assert_response :success
  end

  test "should create opportunity_application" do
    assert_difference('OpportunityApplication.count') do
      post opportunity_applications_url, params: { opportunity_application: { availability: @opportunity_application.availability, choices: @opportunity_application.choices, profile_id: @opportunity_application.profile_id, submitted: @opportunity_application.submitted } }
    end

    assert_redirected_to opportunity_application_url(OpportunityApplication.last)
  end

  test "should show opportunity_application" do
    get opportunity_application_url(@opportunity_application)
    assert_response :success
  end

  test "should get edit" do
    get edit_opportunity_application_url(@opportunity_application)
    assert_response :success
  end

  test "should update opportunity_application" do
    patch opportunity_application_url(@opportunity_application), params: { opportunity_application: { availability: @opportunity_application.availability, choices: @opportunity_application.choices, profile_id: @opportunity_application.profile_id, submitted: @opportunity_application.submitted } }
    assert_redirected_to opportunity_application_url(@opportunity_application)
  end

  test "should destroy opportunity_application" do
    assert_difference('OpportunityApplication.count', -1) do
      delete opportunity_application_url(@opportunity_application)
    end

    assert_redirected_to opportunity_applications_url
  end
end
