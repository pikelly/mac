class ProcessorPrice  < ActiveRecord::Base
  belongs_to :computer
  belongs_to :processor
  default_scope :joins => [:processor], :order => 'processors.position'

  def <=> other
    self.processor.position <=> other.processor.position
  end
  def label
    processor.name
  end
end