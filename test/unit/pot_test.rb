require 'test_helper'

class PotTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Pot.new.valid?
  end
end
