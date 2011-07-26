require 'rake'
require_relative "../../config/environment"
desc 'Moves Posts to archive'
task :archive do
  Post.archive 
end
