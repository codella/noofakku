require 'test/unit'
require 'noofakku/processor'
require 'shoulda'
require 'ostruct'

module Noofakku

  class ProcessorTest < Test::Unit::TestCase

    context "Execution" do

      setup do
        @spy_instruction = SpyInstruction.new
        @instance = Processor.new({"x" => @spy_instruction})
      end

      should "throw on nil instruction" do
        assert_raise (RuntimeError) { Processor.new(nil) }
      end

      should "throw on nil program" do
        assert_raise (RuntimeError) { @instance.run(nil, Object.new, Object.new, Object.new) }
      end

      should "throw on nil memory" do
        assert_raise (RuntimeError) { @instance.run(Object.new, nil, Object.new, Object.new) }
      end

      should "throw on nil input" do
        assert_raise (RuntimeError) { @instance.run(Object.new, Object.new, nil, Object.new) }
      end

      should "throw on nil output" do
        assert_raise (RuntimeError) { @instance.run(Object.new, Object.new, Object.new, nil) }
      end

      should "invoke instructions" do
        input = -> {}
        output = ->value {}
        @instance.run('x', [], input, output)
        assert_true @spy_instruction.invoked
      end

    end

  end

  class SpyInstruction
    attr_reader :invoked
    def perform(processor, memory, program, input, output); @invoked = true; end
  end

end