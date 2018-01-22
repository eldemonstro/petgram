source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'coffee-rails', '~> 4.2'
gem 'jbuilder', '~> 2.5'
gem 'pg', '~> 0.18'
gem 'rails', '~> 5.1.4'
gem 'sass-rails', '~> 5.0'
gem 'simple_form'
gem 'turbolinks', '~> 5'
gem 'uglifier', '>= 1.3.0'
gem 'unicorn'

gem 'bootstrap', '~> 4.0.0.beta2.1'
gem 'i18n-js'
gem 'jquery-rails'

group :development, :test do
  gem 'factory_bot_rails'
  gem 'fuubar'
  gem 'pry-byebug'
  gem 'rspec-rails'
  gem 'rubocop'
  gem 'webmock'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'capybara'
  gem 'poltergeist'
  gem 'rails-controller-testing'
  gem 'simplecov', require: false
end
