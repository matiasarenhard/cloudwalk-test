class AddAuthenticationTokenToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :authentication_token, :string, limit: 254
    add_index :users, :authentication_token, unique: true
  end
end
