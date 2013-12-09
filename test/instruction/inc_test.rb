require 'test/unit'
require 'noofakku/instruction/inc'
require 'shoulda'
require 'ostruct'

class IncTest < Test::Unit::TestCase

  context "Hook" do

    should "return '+' as hook character" do
      assert_equal "+", Inc.new.hook
    end

  end

  context "Execution" do

    setup do
      @instance = Inc.new
    end

    should "should throw on nil processor" do
      assert_raise (RuntimeError) { @instance.perform(nil, Object.new) }
    end

    should "should throw on nil memory" do
      assert_raise (RuntimeError) { @instance.perform(Object.new, nil) }
    end

    should "should increment memory cell addressed by the pointer" do
      spy_processor = OpenStruct.new
      spy_processor.pointer = 0
      spy_memory = [0]
      @instance.perform(spy_processor, spy_memory)
      assert_equal 1, spy_memory[spy_processor.pointer]
    end

  end

end