class Client < ApplicationRecord
	has_secure_password

	validates :username, presence: true, on: :create
	validates :password, presence: true, on: :create
	validates :first_name, presence: true, on: :create
	validates :last_name, presence: true, on: :create
	validates :balance, presence: true, numericality: true
	validates :account_number, presence: true, uniqueness: true, on: :create

	before_validation :set_defaults

	has_many :account_transactions, dependent: :destroy

	def set_defaults
		if self.new_record?
			self.balance = self.balance.to_f
			self.account_number = SecureRandom.hex(5)
		end
	end
	
	
	def to_s
		"#{last_name.capitalize}, #{first_name.capitalize}"
	end
end
