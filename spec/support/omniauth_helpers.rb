module OmniauthHelpers
  def mock_auth_hash
    OmniAuth.config.mock_auth[:linkedin] = {
      'provider': 'linkedin',
      'uid': '5XY_Lczdly',
      'info': {
        'name': Faker::Name.name,
        'first_name': Faker::Name.first_name,
        'last_name': Faker::Name.last_name,
        'email': Faker::Internet.email,
        'urls': {
            'public_profile': Faker::Internet.url
        }
      },
      'credentials': {
        'token': '9d62ee1f-bf69-496e-bf93-76261d32b9c2',
        'secret': 'e5c86471-a02d-41ba-ad74-235e8060c427'
      }
    }
  end
end
