require 'colorize'
require_relative 'search_slack'

# Module to read data from Slack and show it on console
module ConsoleSlack
  include SearchOnSlack

  def format_new_message(data)
    user_p = if data.subtype == 'bot_message'
               data.username
             else
               user = get_user_info(data.user)
               user.real_name
             end
    text = data.text
    channel_p = conversation_info(data.channel)
    if @current_channel == channel_p.id
      print "\n#{user_p}: ".yellow + text.blue
    else
      print "\n--- #{channel_p.name} ---".green
      print "\n#{user_p}: ".yellow + text.blue
    end
    @current_channel = channel_p.id
  end
end
