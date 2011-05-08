class RamPrice  < ActiveRecord::Base
  belongs_to :computer
  belongs_to :ram
  default_scope :joins => [:ram], :order => 'rams.position'

  validates_numericality_of :value, :only_integer => true, :allow_nil => true

  def <=> other
    ram.position <=> other.ram.position
  end

  def label
    ram.name
  end

end