require 'rake'

desc 'Starts the Jabber Bot'
task :bstart do
  bundle exec ruby 'lib/jabber/bot.rb' 
end
