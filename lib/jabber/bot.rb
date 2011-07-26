require 'jabber/bot'
require_relative "../../config/environment"

#module Jabber
#  class Bot
#    backgrounded :connect
#  end
#end

config = {
  :name		=> 'PostBot',
  :jabber_id	=> 'feedme@stealmyco.de/bot',
  :password	=> 'imbaimba123',
  :master	=> 'mashup@stealmyco.de',
  :is_public	=> true
}

bot = Jabber::Bot.new(config)
  
  def master? (jabber_id)
	@config[:master].include? jabber_id
  end

bot.add_command(
  :syntax	=> 'posts!<string>',
  :description	=> 'Post something on your Blog',
  :regex	=> /\Aposts\!\s+\"(.+)\"\s+(.+)\z/,
  :is_public	=> false
) do |sender, message|
    puts "#{sender} Title: #{message[0]}, Content: #{message[1]}"
    Post.create :author_id => 1, :title => message[0], :content => message[1]
end
bot.connect
