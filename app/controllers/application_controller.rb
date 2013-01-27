# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  include Authentication
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  filter_parameter_logging :password
  before_filter :login_required
  private
  def find_by_id
    kind = controller_name.singularize
    instance_variable_set "@#{kind}", kind.capitalize.constantize.find(params[:id])
    true
  end
end
