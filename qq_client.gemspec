require_relative 'lib/qq_client/version'

Gem::Specification.new do |s|
  s.authors         = ["Daniel Gonzalez"]
  s.email           = ["danigonza86@gmail.com"]
  s.name            = 'qq_client'
  s.version         = QqClient::VERSION
  s.summary         = "QqClient"
  s.description     = "A qq client for oath2 and API with a omniauth strategie"
  s.files           = `git ls-files`.split($\)
  s.require_paths   = ["lib"]
  s.add_dependency 'rest-client', '~> 1'
  s.homepage        = 'http://rubygems.org/gems/qq_client'
  s.license         = 'MIT'
end
