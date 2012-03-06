class ApplicationController < ActionController::Base
  protect_from_forgery
  #include ApplicationHelper
  helper :sessions

end
