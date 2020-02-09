class ApplicationController < ActionController::Base
	before_action :authenticate_user!

	 def after_sign_in_path_for(resource)
	 	user_path(resource.id)
	 end
	 def after_sign_up_path_for(resource)
	 	user_path(resource.id)
	 end
end
