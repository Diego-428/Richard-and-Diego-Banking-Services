class SessionsController < ApplicationController
	#DELETE /logout
	def destroy
		session[:client_id] = nil
		redirect_to root_path, notice: "Logged out"
	end
end