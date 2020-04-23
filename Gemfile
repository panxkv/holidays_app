source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.5'

gem 'rails', '~> 5.2.4', '>= 5.2.4.1'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.11'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'warden', '~> 1.2', '>= 1.2.8'
gem 'grape'
gem 'grape-entity', '~> 0.5.0'
gem 'bcrypt', '~> 3.1', '>= 3.1.11'
gem 'rubocop', '~> 0.82.0'


group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rspec-its'
  gem 'rspec-rails', '~> 4.0'
  gem 'factory_bot_rails'
  gem 'faker', '~> 2.11'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end


# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
