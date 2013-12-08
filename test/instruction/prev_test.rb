require 'test/unit'
require 'noofakku/instruction/prev'

class PrevTest < Test::Unit::TestCase
  def test_hook
    assert_equal "<", Prev.new.hook
  end
end