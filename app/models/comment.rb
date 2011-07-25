class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :author, :foreign_key => :author_id, :class_name => "User"                                                                                                        
  validates :content, :presence => true,
    :length => { :minimum => 5, :maximum => 1024 }

end
