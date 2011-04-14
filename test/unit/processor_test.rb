require 'test_helper'

class ProcessorTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Processor.new.valid?
  end
end
