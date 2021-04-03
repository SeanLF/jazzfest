DashboardPolicy = Struct.new(:user, :dashboard) do
  include Auth0Helper

  def apply?
    return true if at_least_coordinator?

    active_event = Pundit.policy_scope(user, Event).active
    Date.today.between?(active_event.registration_start_date, active_event.registration_end_date)
  end

  def success?
    true
  end

  def elevated_user_dashboard?
    at_least_coordinator?
  end
end
