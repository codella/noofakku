require 'test/unit'
require 'noofakku/instruction/closed_bracket'
require 'shoulda'
require 'ostruct'

class ClosedBracketTest < Test::Unit::TestCase

  context "Hook" do

    should "return ']' as hook character" do
      assert_equal "]", ClosedBracket.new.hook
    end

  end

  context "Execution" do

    setup do
      @instance = ClosedBracket.new
    end

    should "throw on nil processor" do
      assert_raise (RuntimeError) { @instance.perform(nil, Object.new, Object.new) }
    end

    should "throw on nil memory" do
      assert_raise (RuntimeError) { @instance.perform(Object.new, nil, Object.new) }
    end

    should "throw on nil program" do
      assert_raise (RuntimeError) { @instance.perform(Object.new, Object.new, nil) }
    end

    should "throw if instruction pointer is not pointing to an open bracket" do
      spy_processor = OpenStruct.new(instruction_pointer: 0)
      assert_raise (RuntimeError) { @instance.perform(spy_processor, Object.new, "_") }
    end

    should "leave the instruction pointer as is if data pointer points to a cell which value is zero" do
      spy_processor = OpenStruct.new(instruction_pointer: 2, data_pointer: 0)
      @instance.perform(spy_processor, [0], "[_]_")
      assert_equal 2, spy_processor.instruction_pointer
    end

    should "change the instruction pointer in order to point to the matching '[' if data pointer points to a cell which value is not zero" do
      spy_processor = OpenStruct.new(instruction_pointer: 2, data_pointer: 0)
      @instance.perform(spy_processor, [42], "[_]_")
      assert_equal 0, spy_processor.instruction_pointer
    end

  end

end