class HomeController < ApplicationController
  after_action :skip_authorization

  def landing
    registration_start_date = @active_event.registration_start_date
    if Date.today < registration_start_date
      registration_start_date = registration_start_date.strftime("%A, %B #{registration_start_date.day.ordinalize}")
      @registration_text = "Registration opens on #{registration_start_date}"
    end
    start_date = @active_event.start_date
    @festival_start_date = start_date.strftime("%B #{start_date.day.ordinalize}")
    end_date = @active_event.end_date
    @festival_end_date = end_date.strftime("%B #{end_date.day.ordinalize}")
  end

  def code_of_conduct
  end

  def about
  end

  def help
  end
end
