class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  include DeviseTokenAuth::Concerns::SetUserByToken
  def after_sign_in_path_for(resource)
    project_index_path
  end
end
