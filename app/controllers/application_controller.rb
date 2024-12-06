class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :find_communities

  def find_communities
    @communities = Community.all.order(:title)
  end

  protected

  # Add custom fields to the Devise registration form
  def configure_permitted_parameters
    added_attrs = [:username]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end

  # Override the after_sign_in_path_for method
  def after_sign_in_path_for(resource)
    path = stored_location_for(resource) || root_path
  end
end
