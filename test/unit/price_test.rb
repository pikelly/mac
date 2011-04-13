require 'test_helper'

class PriceTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Price.new.valid?
  end
end
