require 'test_helper'

class QuoteTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Quote.new.valid?
  end
end
