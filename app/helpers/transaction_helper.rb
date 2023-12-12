module TransactionHelper
	# Class to execute a bank transaction
	class ExecuteTransaction
	  # Initializes a new transaction with the given amount and transaction type
	  #
	  # @param amount [Float] The amount to be transacted
	  # @param transaction_type [String] The type of transaction ("withdraw" or "deposit")
	  def initialize(amount, transaction_type)
		@amount = amount.to_f
		@transaction_type = transaction_type
		@transaction_errors = []
	  end
  
	  # Executes the financial transaction
	  #
	  # @return [Array] An array of transaction errors or an empty array if successful
	  def execute!
		if Current.client.blank?
		  @transaction_errors << "This account does not exist!"
		elsif @transaction_type == "withdraw" && Current.client.balance.to_f - @amount < 0.00
			@transaction_errors << "You do not have enough funds to complete this transaction!"
		elsif @amount < 0.00
			@transaction_errors << "Amount cannot be a negative number."
		else
		  ActiveRecord::Base.transaction do
			AccountTransaction.create!(
			  client: Current.client,
			  amount: @amount,
			  transaction_type: @transaction_type
			)
  
			if @transaction_type == "withdraw"
			  Current.client.update!(balance: Current.client.balance.to_f - @amount)
			elsif @transaction_type == "deposit"
			  Current.client.update!(balance: Current.client.balance.to_f + @amount)
			end
		  end
		end
		@transaction_errors
	  end
	end
  end