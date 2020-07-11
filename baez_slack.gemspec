Gem::Specification.new do |s|
  s.name        = 'baez_slack'
  s.version     = '0.0.8'
  s.date        = '2020-07-10'
  s.summary     = 'Core functions for any kind of interaction with Slack'
  s.description = 'The dream of enerbot'
  s.authors     = ['Luciano Adonis', 'Nicolas Noudia']
  s.email       = 'luciano.adonisv@gmail.com'
  s.files       = ['lib/baez_slack.rb', 'lib/credentials.rb', 'lib/modules/message_slack.rb', 'lib/modules/search_slack.rb', 'lib/modules/read_slack.rb', 'lib/modules/console_slack.rb', 'lib/modules/regex_slack.rb']
  s.homepage    =
    'https://rubygems.org/gems/core_slack'
  s.license = 'MIT'
  s.add_dependency 'async-websocket', '~> 0.8.0'
  s.add_dependency 'colorize'
  s.add_dependency 'slack-ruby-client', '~> 0.14.5'
  s.add_development_dependency 'rspec', '~> 3.2'
end
