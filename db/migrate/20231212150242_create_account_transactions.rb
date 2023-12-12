class CreateAccountTransactions < ActiveRecord::Migration[7.1]
  def change
    create_table :account_transactions do |t|
      t.decimal :amount
      t.string :transaction_type
      t.references :client, null: false, foreign_key: true

      t.timestamps
    end
  end
end
