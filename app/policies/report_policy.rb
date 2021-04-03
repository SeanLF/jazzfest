ReportPolicy = Struct.new(:user, :report) do
  include Auth0Helper

  def export_opportunity_applications?
    elevated_action?
  end

  def export_opportunity_application_coordinator_comments?
    elevated_action?
  end

  def elevated_action?
    role?('Coordinator') || role?('Administrator')
  end
end
