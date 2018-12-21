class AddTokenToOauthAccounts < ActiveRecord::Migration[5.2]
  def change
    add_column :oauth_accounts, :token, :string
  end
end
