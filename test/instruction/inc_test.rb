require 'test/unit'
require 'noofakku/instruction/inc'
require 'shoulda'
require 'ostruct'

module Noofakku

  class IncTest < Test::Unit::TestCase

    context "Execution" do

      setup do
        @instance = Inc.new
      end

      should "throw on nil processor" do
        assert_raise (RuntimeError) { @instance.perform(nil, Object.new, Object.new, Object.new, Object.new) }
      end

      should "throw on nil memory" do
        assert_raise (RuntimeError) { @instance.perform(Object.new, nil, Object.new, Object.new, Object.new) }
      end

      should "increment memory cell addressed by the data pointer" do
        spy_processor = OpenStruct.new(data_pointer: 0)
        spy_memory = [0]
        @instance.perform(spy_processor, spy_memory, nil, nil, nil)
        assert_equal 1, spy_memory[spy_processor.data_pointer]
      end

    end

  end

end