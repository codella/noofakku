require 'test/unit'
require 'noofakku/instruction/prev'
require 'shoulda'
require 'ostruct'

module Noofakku

  class PrevTest < Test::Unit::TestCase

    context "Execution" do

      setup do
        @instance = Prev.new
      end

      should "throw on nil processor" do
        assert_raise (RuntimeError) { @instance.perform(nil, nil, Object.new, Object.new, Object.new) }
      end

      should "decrement memory data pointer" do
        spy_processor = OpenStruct.new(data_pointer: 0)
        @instance.perform(spy_processor, nil, nil, nil, nil)
        assert_equal -1, spy_processor.data_pointer
      end

    end

  end

end