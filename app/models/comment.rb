class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :author, :foreign_key => :author_id, :class_name => "User"                                                                                                        
end
