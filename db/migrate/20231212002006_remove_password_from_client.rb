class RemovePasswordFromClient < ActiveRecord::Migration[7.1]
  def change
    remove_column :clients, :password, :string
  end
end
