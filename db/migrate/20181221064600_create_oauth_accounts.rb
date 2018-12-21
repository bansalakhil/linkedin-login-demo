class CreateOauthAccounts < ActiveRecord::Migration[5.2]
  def change
    create_table :oauth_accounts do |t|
      t.belongs_to :user, index: true
      t.string :provider
      t.string :uid
      t.string :image_url
      t.string :profile_url
      t.string :access_token
      t.text :raw_data
      t.timestamps null: false
    end
  end
end
