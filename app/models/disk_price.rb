class DiskPrice  < ActiveRecord::Base
  belongs_to :computer
  belongs_to :disk

  validates_numericality_of :value, :only_integer => true, :allow_nil => true

  default_scope :joins => [:disk], :order => 'disks.position'

  def <=> other
    self.disk.position <=> other.disk.position
  end

  def label
    disk.name
  end

end