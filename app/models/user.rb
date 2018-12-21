class User < ApplicationRecord

  has_one :oauth_account, dependent: :destroy

  def full_name
    firstname + lastname
  end

end
