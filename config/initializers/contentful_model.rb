ContentfulModel.configure do |config|
  config.access_token = ENV["CONTENTFUL_KEY"]
  config.space = ENV["CONTENTFUL_SPACE_ID"]
end
