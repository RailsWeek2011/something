class Gallery < ActiveRecord::Base
  attr_accessible :name, :visibility
  has_many :paintings, :dependent => :destroy
end
