require 'cinch'

class AutoOp
  include Cinch::Plugin

  listen_to :join
  match(/autoop (on|off)$/)

  def listen(m)
    unless m.user.nick == bot.nick
      m.channel.op(m.user) if @auto_op
    end
  end

  def execute(m, option)
    if(m.channel.opped?(m.user))
      @auto_op = option == "on"
    end
    m.reply "AutoOp is now #{@auto_op  ? 'enabled' : 'disabled'}"
  end

end

bot = Cinch::Bot.new do
  configure do |c|
    c.server = "irc.freenode.org"
    c.channels = ["#riotcon"]
    c.nick = "riotbot"		  
    c.plugins.plugins = [AutoOp]
  end

  on :message, "hello" do |m|
    m.reply "Hello, #{m.user.nick}"
  end

  on :message, /cop|pig|police|popo|swine|fiveoh|5-0|5oh|onetime|one time/ do |m|
    m.reply random_ftp
  end
  
end

def random_ftp()
  return [ 
    "Fuck the police!", 
    "ACAB", 
    "The only good cop is a dead cop", 
    "Cops! Pigs! Murderers!"
  ].shuffle.sample
end

bot.start

