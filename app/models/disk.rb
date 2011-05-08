class Disk < ActiveRecord::Base
  attr_accessible :name, :size
  
  #has_and_belongs_to_many :computers
  has_many :disk_prices, :dependent => :destroy
  has_many :computers, :through => :disk_prices
  has_many :quotes
  has_many :prices
  
  before_validation :strip_name
  validates_numericality_of :size, :only_integer => true

  acts_as_list
  default_scope :order => "position"

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
