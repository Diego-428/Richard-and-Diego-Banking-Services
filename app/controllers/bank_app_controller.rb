class BankAppController < ApplicationController

  #GET    /bank_app
  def index
    if Current.client
      redirect_to bank_app_path(Current.client)
    end
  end

  #POST   /bank_app
  def create
    session_params = params.permit(:username, :password)
    @client = Client.find_by(username: session_params[:username])

    if @client.present? && @client.authenticate(session_params[:password])
      puts "Hit"
      session[:client_id] = @client.id
      redirect_to bank_app_path(@client), notice: "Logged in successfully!"
    else
      redirect_to root_path, alert: "Login is invalid!"
    end
  end

  #GET    /about
  def about
  end

  #GET    /withdraw
  def withdraw
  end

  #POST    /withdraw
  def set_withdraw
    withdrawal_params = params.permit(:amount)

    transaction_errors = ::TransactionHelper::ExecuteTransaction.new(
      withdrawal_params[:amount].to_f, "withdraw"
    ).execute!

    if transaction_errors.length > 0
      flash[:alert] = transaction_errors[0]
      redirect_to root_path
    else
      redirect_to bank_app_path(Current.client)
    end
  end

  #GET    /deposit
  def deposit
  end

  #POST   /deposit
  def set_deposit
    deposit_params = params.permit(:amount)

    transaction_errors = ::TransactionHelper::ExecuteTransaction.new(
      deposit_params[:amount].to_f, "deposit"
    ).execute!

    if transaction_errors.length > 0
      flash[:alert] = transaction_errors[0]
      redirect_to root_path
    else
      redirect_to bank_app_path(Current.client)
    end
  end

  #GET    /bank_app/:id
  def show
  end
end
