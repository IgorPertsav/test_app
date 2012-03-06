class ApplicationController < ActionController::Base
  protect_from_forgery
  include ApplicationHelper

  def signed_in?
    !current_user.nil?
  end
end
