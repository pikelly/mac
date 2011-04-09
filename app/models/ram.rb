class Ram < ActiveRecord::Base
  attr_accessible :name, :size
  
  has_and_belongs_to_many :computers
end
