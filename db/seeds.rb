# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#

u = User.new :email => "admin@localhost.org", :password => "password", :password_confirmation => "password"
u.admin = true
u.save

p = Post.new :title => "Testtitle", :content => "h1. Give RedCloth a try!A *simple* paragraph with a line break, some _emphasis_", :author_id => "1"
p.save
