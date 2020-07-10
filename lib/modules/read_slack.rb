require_relative 'message_slack'
require_relative 'console_slack'
require './actions/modes'

# Module for reading chat incoming messages
module ReadSlack
  include ConsoleSlack
  include DirectiveLookup

  def share_message(data, output)
    case output
    when 'slack'
      check_type(data)
    when 'console'
      format_new_message(data)
    else
      format_new_message(data)
      check_type(data)
    end
  end

  def single_client(output = ENV['SLACK_DEFAULT_OUTPUT'])
    @time_client.on :message do |data|
      share_message(data, output)
    end
    @time_client.start!
  end
end
