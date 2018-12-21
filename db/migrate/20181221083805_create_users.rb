class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email
      t.string :firstname
      t.string :lastname
      t.string :headline
      t.string :industry
      t.string :location_name
      t.string :country
      t.string :profile_url
      t.string :token
    end
  end
end
