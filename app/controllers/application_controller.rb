# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  include Authentication
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  filter_parameter_logging :password
  before_filter :login_required

  def sort
    kind = controller_name.singularize
    for obj in instance_variable_get "@#{kind.pluralize}"
      obj.position = params["#{kind}-list"].index(obj.id.to_s)+1
      obj.save
    end
    head 200
  end

  private
  def find_by_id
    kind = controller_name.singularize
    instance_variable_set "@#{kind}", kind.capitalize.constantize.find(params[:id])
  end

  def find_all
    kinds = controller_name
    instance_variable_set "@#{kinds}", kinds.singularize.capitalize.constantize.all
  end

end
