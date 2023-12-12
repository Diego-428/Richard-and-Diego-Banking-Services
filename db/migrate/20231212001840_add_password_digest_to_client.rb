class AddPasswordDigestToClient < ActiveRecord::Migration[7.1]
  def change
    add_column :clients, :password_digest, :string
  end
end
