class Gallery < ActiveRecord::Base
  attr_accessible :name, :visibility
  has_many :paintings, :dependent => :destroy

  validates :name, :presence => true,
    :length => { :minimum => 3, :maximum => 12}
end
