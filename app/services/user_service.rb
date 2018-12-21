class UserService

  def initialize(auth_hash)
    @auth_hash = auth_hash
  end

  def create_user
    @user = User.find_by(token: @auth_hash[:uid])
    if @user
      @user.update!(user_params)
    else
      create_new_user
    end
    @user
  end

  private def create_new_user
    @user = User.new(user_params)
    @account = @user.build_oauth_account(oauth_account_params)
    @user.save
  end

  private def user_params
    {
      email: @auth_hash[:extra][:raw_info][:emailAddress],
      firstname: @auth_hash[:extra][:raw_info][:firstName],
      lastname: @auth_hash[:extra][:raw_info][:lastName],
      headline: @auth_hash[:extra][:raw_info][:headline],
      industry: @auth_hash[:extra][:raw_info][:industry],
      profile_url: @auth_hash[:extra][:raw_info][:pictureUrl],
      location_name: @auth_hash[:extra][:raw_info][:location][:name],
      country: @auth_hash[:extra][:raw_info][:location][:country][:code],
      token: @auth_hash[:uid]
    }
  end

  private def oauth_account_params
    {
      uid: @auth_hash[:uid],
      provider: @auth_hash[:provider],
      image_url: @auth_hash[:info][:image],
      profile_url: @auth_hash[:info][:urls][:public_profile],
      raw_data: @auth_hash[:extra][:raw_info].to_json
    }
  end

end
