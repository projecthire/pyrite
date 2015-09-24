module FeatureSubdomainHelpers
  # Sets Capybara to use a given subdomain.
  def with_subdomain(subdomain)
    before { Capybara.default_host = "http://#{subdomain}.example.com" }
    after  { Capybara.default_host = "http://www.example.com" }
    yield
  end
end
