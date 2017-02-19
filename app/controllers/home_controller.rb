class HomeController < ApplicationController
  after_action :skip_authorization
  def show
    registration_start_date = Date.parse(@registration_start_date)
    if Date.today < registration_start_date
      registration_start_date = registration_start_date.strftime("%A, %B #{registration_start_date.day.ordinalize}")
      @registration_text = "Registration opens on #{registration_start_date}"
    end
    @festival_start_date = Date.parse(@festival_start_date)
    @festival_start_date = @festival_start_date.strftime("%B #{@festival_start_date.day.ordinalize}")
    @festival_end_date = Date.parse(@festival_end_date)
    @festival_end_date = @festival_end_date.strftime("%B #{@festival_end_date.day.ordinalize}")
  end

  def code_of_conduct
  end
end
