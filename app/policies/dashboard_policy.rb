class DashboardPolicy < Struct.new(:user, :dashboard)
  include Auth0Helper

  def apply?
    return true if role?('Coordinator') || role?('Admin')
    active_event = Pundit.policy_scope(user, Event).active
    Date.today.between?(active_event.registration_start_date, active_event.registration_end_date)
  end

  def success?
    true
  end

  def elevated_user_dashboard?
    role?('Coordinator') || role?('Admin')
  end
end
