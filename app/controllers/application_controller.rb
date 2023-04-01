class ApplicationController < ActionController::Base

  def after_sign_in_path_for(resource)
    case resource
    when Admin
      #public_homes_top_path
      admins_homes_top_path
    when Public
      public_homes_top_path
    end
  end

end
