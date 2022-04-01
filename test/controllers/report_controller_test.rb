# frozen_string_literal: true

require "test_helper"

class ReportControllerTest < ActionDispatch::IntegrationTest
  test "should get export_opportunity_applications" do
    get report_export_opportunity_applications_url
    assert_response :success
  end
end
