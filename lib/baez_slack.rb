require 'slack-ruby-client'
require_relative "modules/message_slack"
require_relative "modules/search_slack"
require_relative 'modules/read_slack'
require_relative 'modules/regex_slack'
require_relative "credentials"

# Groups client initialization with instance parameters
class BaezSlack < Credentials
  include MessageSlack
  include ReadSlack
  include RegexpSlack
  include SearchOnSlack

  def initialize(name = '', image = '', token = nil)
    set_credentials

    Slack.configure do |config|
      config.token = token.nil? ? @bot_token : token
      config.raise 'Missing token' unless config.token
    end

    @bot_name = name unless name.empty?
    @bot_icon = image unless image.empty?

    @time_client ||= Slack::RealTime::Client.new
    @web_client ||= Slack::Web::Client.new
  end
end
