# Module for regular expressions that are common
module RegexpSlack
  def get_values_from(text, type = 'user')
    pattern = case type
              when 'user'
                /<@(.*)>/
              when 'channel'
                /<#(.*)\|(.*)>/
              end
    text.match(pattern)
  end

  def echo(data, _pattern = '\echo')
    match = data.match(/^\\echo\s(\<[#@])?((.*)\|)?(.*?)(\>)? (.*?)$/i)
    unless match.nil?
      channel = match.captures[2] || match.captures[3]
      text = match.captures[5]
      check_ts = channel.match(/(.*)-(\d*\.\d*)/)
      # Useless... until someone find something
      channel = check_ts.captures[0] unless check_ts.nil?
      thread = check_ts.captures[1] unless check_ts.nil?
    end
    [text, channel, thread]
  end
end