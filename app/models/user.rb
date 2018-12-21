class User < ApplicationRecord

  has_one :oauth_account, dependent: :destroy

  def full_name
    firstname + lastname
  end

  def masked_entity(key)
    attribute = send(key)
    attribute[0] + attribute[1..-1].gsub(/\w/, '*')
  end

end
