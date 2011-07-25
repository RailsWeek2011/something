class Post < ActiveRecord::Base
  has_many :comments
  belongs_to :author, :foreign_key => :author_id, :class_name => "User"
end
