class Post < ActiveRecord::Base
  validates :title, :presence => true
  validates :content, :presence => true, :length => { :minimum => 5 }
  has_many :comments, :dependent => :destroy
  belongs_to :author, :foreign_key => :author_id, :class_name => "User"
end
