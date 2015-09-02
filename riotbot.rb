require 'cinch'

bot = Cinch::Bot.new do
  configure do |c|
    c.server = "irc.freenode.org"
    c.channels = ["#riotbot"]
    c.nick = "riotbot"		  
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
