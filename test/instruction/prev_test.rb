require 'test/unit'
require 'noofakku/instruction/prev'
require 'shoulda'
require 'ostruct'

module Noofakku

  class PrevTest < Test::Unit::TestCase

    context "Hook" do

      should "return '<' as hook character" do
        assert_equal "<", Prev.new.hook
      end

    end

    context "Execution" do

      setup do
        @instance = Prev.new
      end

      should "throw on nil processor" do
        assert_raise (RuntimeError) { @instance.perform(nil, nil, Object.new) }
      end

      should "decrement memory data pointer" do
        spy_processor = OpenStruct.new(data_pointer: 0)
        @instance.perform(spy_processor, nil, nil)
        assert_equal -1, spy_processor.data_pointer
      end

    end

  end

end