class AccountTransaction < ApplicationRecord
  belongs_to :client

  validates :client, presence: true
  validates :amount, presence: true, numericality: true
  validates :transaction_type, presence: true, inclusion: {in: ["withdraw", "deposit"]}
end
