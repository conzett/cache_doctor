# -*- encoding: utf-8 -*-
Gem::Specification.new do |s|

  s.name        = 'rails-cache-utils'
  s.author      = 'Graham Conzett'
  s.email       = 'conzett@gmail.com'
  s.summary     = 'Rails 3 and up'
  s.description = 'A description'
  s.license     = 'MIT'

  # Dependencies
  s.add_dependency 'railties', '>= 3.2.0', '< 5.0'
  s.add_dependency 'coffee-rails', '>= 3.2.2'
  s.add_development_dependency 'rails',        '~> 3.2'
  s.required_rubygems_version = '>= 1.3.6'

  s.homepage = "http://github.com/conzett/#{s.name}"
  s.version = '0.1.0'
  s.require_paths = ['lib']
  s.files = %W(Gemfile rails-cache-utils.gemspec vendor/assets/javascripts/#{s.name}.js.coffee)
  s.files += Dir.glob('lib/*.rb')
  s.files += Dir.glob("lib#{s.name}**/*.rb")
end