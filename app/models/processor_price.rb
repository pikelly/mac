class ProcessorPrice  < ActiveRecord::Base
  belongs_to :computer
  belongs_to :processor
  default_scope :joins => [:processor], :order => 'processors.position'

  validates_numericality_of :value, :only_integer => true, :allow_nil => true

  def <=> other
    processor.position <=> other.processor.position
  end

  def label
    processor.name
  end
end