class Post < ActiveRecord::Base
  validates :title, :presence => true
  validates :content, :presence => true, :length => { :minimum => 5 }
  has_many :comments, :dependent => :destroy
  belongs_to :author, :foreign_key => :author_id, :class_name => "User"

  def self.archive
    Post.all.each do |post| 
      unless post.archived? 
        if post.created_at < 14.days.ago #(Time.new)-1209600
          post.archived = true
          post.save
        end
      end
    end
  end
end
