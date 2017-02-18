class HomeController < ApplicationController
  after_action :skip_authorization
  def show
  end

  def code_of_conduct
  end
end
