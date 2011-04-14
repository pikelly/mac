require 'test_helper'

class DiskTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Disk.new.valid?
  end
end
