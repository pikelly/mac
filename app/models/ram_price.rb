class RamPrice  < ActiveRecord::Base
  belongs_to :computer
  belongs_to :ram
  default_scope :joins => [:ram], :order => 'rams.position'

  def <=> other
    self.ram.position <=> other.ram.position
  end
  def label
    ram.name
  end

end