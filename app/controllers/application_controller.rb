class ApplicationController < ActionController::Base
	before_action :set_current_client
	
	# Method to set the current client based on the session's client_id
	def set_current_client
		if session[:client_id]
			Current.client = Client.find_by(id: session[:client_id].to_i)
		end
	end
end
