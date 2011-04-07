require 'test_helper'

class RamTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Ram.new.valid?
  end
end
