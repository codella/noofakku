require 'test/unit'
require 'noofakku/instruction/dec'
require 'shoulda'
require 'ostruct'

module Noofakku

  class DecTest < Test::Unit::TestCase

    context "Hook" do

      should "return '-' as hook character" do
        assert_equal "-", Dec.new.hook
      end

    end

    context "Execution" do

      setup do
        @instance = Dec.new
      end

      should "throw on nil processor" do
        assert_raise (RuntimeError) { @instance.perform(nil, Object.new, Object.new) }
      end

      should "throw on nil memory" do
        assert_raise (RuntimeError) { @instance.perform(Object.new, nil, Object.new) }
      end

      should "decrement memory cell addressed by the data pointer" do
        spy_processor = OpenStruct.new(data_pointer: 0)
        spy_memory = [0]
        @instance.perform(spy_processor, spy_memory, nil)
        assert_equal -1, spy_memory[spy_processor.data_pointer]
      end

    end

  end

end