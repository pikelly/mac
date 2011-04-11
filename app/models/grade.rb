class Grade < ActiveRecord::Base
  attr_accessible :name
  
  has_and_belongs_to_many :computers
  has_many :quotes
end
