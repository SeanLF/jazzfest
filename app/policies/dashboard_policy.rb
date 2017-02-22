class DashboardPolicy < Struct.new(:user, :dashboard)
  include Auth0Helper

  def success?
    true
  end

  def elevated_user_dashboard?
    role?('Coordinator') || role?('Admin')
  end
end
