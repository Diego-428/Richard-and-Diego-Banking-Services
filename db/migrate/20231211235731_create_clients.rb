class CreateClients < ActiveRecord::Migration[7.1]
  def change
    create_table :clients do |t|
      t.string :first_name
      t.string :last_name
      t.string :username
      t.string :password
      t.string :balance
      t.string :account_number

      t.timestamps
    end
  end
end
