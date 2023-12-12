class RegistrationsController < ApplicationController
	#GET    /sign_up
	def new
	  @client = Client.new
	end

	# POST   /sign_up
	def create
		@client = Client.new(client_params)
		respond_to do |format|
		  if @client.save
			session[:client_id] = @client.id
			format.html { redirect_to bank_app_path(@client), notice: "Account was successfully created." }
			format.json { render :show, status: :created, location: @client }
		  else
			format.html { render :new, status: :unprocessable_entity }
			format.json { render json: @client.errors, status: :unprocessable_entity }
		  end
		end
	end

	private

	def client_params
		params.require(:client).permit(:first_name, :last_name, :username, :password, :password_confirmation, :balance)
	end
  end