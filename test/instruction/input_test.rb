require 'test/unit'
require 'noofakku/instruction/input'
require 'shoulda'
require 'ostruct'

module Noofakku

  class InputTest < Test::Unit::TestCase

    context "Execution" do

      setup do
        @instance = Input.new
      end

      should "throw on nil processor" do
        assert_raise (RuntimeError) { @instance.perform(nil, Object.new, Object.new, Object.new, Object.new) }
      end

      should "throw on nil memory" do
        assert_raise (RuntimeError) { @instance.perform(Object.new, nil, Object.new, Object.new, Object.new) }
      end

      should "throw on nil input" do
        assert_raise (RuntimeError) { @instance.perform(Object.new, Object.new, Object.new, nil, Object.new) }
      end

      should "fill the memory cell addressed by the data pointer with the value of the yielded block" do
        spy_processor = OpenStruct.new(data_pointer: 0)
        spy_memory = [0]
        input = lambda { 42 }
        @instance.perform(spy_processor, spy_memory, nil, input, nil)
        assert_equal 42, spy_memory[spy_processor.data_pointer]
      end

    end

  end

end