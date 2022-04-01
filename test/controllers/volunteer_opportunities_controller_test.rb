# frozen_string_literal: true

require "test_helper"

class VolunteerOpportunitiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @volunteer_opportunity = volunteer_opportunities(:one)
  end

  test "should get index" do
    get volunteer_opportunities_url
    assert_response :success
  end

  test "should get new" do
    get new_volunteer_opportunity_url
    assert_response :success
  end

  test "should create volunteer_opportunity" do
    assert_difference("VolunteerOpportunity.count") do
      post volunteer_opportunities_url, params: { volunteer_opportunity: { duties_and_responsibilities: @volunteer_opportunity.duties_and_responsibilities, objective: @volunteer_opportunity.objective, qualifications_and_requirements: @volunteer_opportunity.qualifications_and_requirements, shifts: @volunteer_opportunity.shifts, title: @volunteer_opportunity.title } }
    end

    assert_redirected_to volunteer_opportunity_url(VolunteerOpportunity.last)
  end

  test "should show volunteer_opportunity" do
    get volunteer_opportunity_url(@volunteer_opportunity)
    assert_response :success
  end

  test "should get edit" do
    get edit_volunteer_opportunity_url(@volunteer_opportunity)
    assert_response :success
  end

  test "should update volunteer_opportunity" do
    patch volunteer_opportunity_url(@volunteer_opportunity), params: { volunteer_opportunity: { duties_and_responsibilities: @volunteer_opportunity.duties_and_responsibilities, objective: @volunteer_opportunity.objective, qualifications_and_requirements: @volunteer_opportunity.qualifications_and_requirements, shifts: @volunteer_opportunity.shifts, title: @volunteer_opportunity.title } }
    assert_redirected_to volunteer_opportunity_url(@volunteer_opportunity)
  end

  test "should destroy volunteer_opportunity" do
    assert_difference("VolunteerOpportunity.count", -1) do
      delete volunteer_opportunity_url(@volunteer_opportunity)
    end

    assert_redirected_to volunteer_opportunities_url
  end
end
