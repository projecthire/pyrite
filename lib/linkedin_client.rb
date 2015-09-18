class LinkedinClient
  API_KEY = ENV['LINKEDIN_CLIENT_KEY']
  SECRET_KEY = ENV['LINKEDIN_CLIENT_SECRET']

  def self.authorize_user(user)
    linkedin_auth = LinkedinAuth.find_by(user_id: user.id)
    token = linkedin_auth.token
    secret = linkedin_auth.secret

    client = LinkedIn::Client.new(API_KEY, SECRET_KEY)
    client.authorize_from_access(token, secret)
    client
  end

  def self.get_profile(user, options={})
    client = self.authorize_user(user)
    client.profile(options)
  end
end
