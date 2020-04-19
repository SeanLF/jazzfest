require 'authentication'
class ApplicationController < ActionController::Base
  include ::Authentication
end
