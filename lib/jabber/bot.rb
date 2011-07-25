require 'jabber/bot'
require_relative "../../config/environment"

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
  :syntax	=> 'posts! <string>',
  :description	=> 'Post something on your Blog',
  :regex	=> /^posts!\s+(.+)$/,
  :is_public	=> false
) do |sender, message|
  puts "#{sender}  #{message}"
  Post.create :author_id => 1, :title => "ghjkj", :content => message
end
bot.connect
