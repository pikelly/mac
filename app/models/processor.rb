class Processor < ActiveRecord::Base
  attr_accessible :name, :speed
  
  has_many :processor_prices, :dependent => :destroy
  has_many :computers, :through => :processor_prices
  has_many :quotes
  has_many :prices

  acts_as_list
  default_scope :order => "position"

  before_validation :strip_name
  validates_numericality_of :speed, :only_integer => true

  def <=> other
    self.name <=> other.name
  end

  def to_s
    name.to_s
  end

  private
  def strip_name
    self.name.strip!
  end
end
