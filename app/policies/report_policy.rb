class ReportPolicy < Struct.new(:user, :report)
  include Auth0Helper

  def export_opportunity_applications?
    elevated_action?
  end

  def export_opportunity_application_comments?
    elevated_action?
  end

  def elevated_action?
    role?('Coordinator') || role?('Admin')
  end
end
