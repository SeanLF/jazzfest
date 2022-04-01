# frozen_string_literal: true

ReportPolicy = Struct.new(:user, :report) do
  include Auth0Helper

  def export_opportunity_applications?
    at_least_coordinator?
  end

  def export_opportunity_application_coordinator_comments?
    at_least_coordinator?
  end
end
