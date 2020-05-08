class PublicPagesController < ApplicationController
  before_action {authorize :public_pages}
  def home
  end
end
