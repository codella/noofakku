require 'test/unit'
require 'noofakku/instruction/noop'
require 'shoulda'
require 'ostruct'

module Noofakku

  class NoopTest < Test::Unit::TestCase

    context "Execution" do

      setup do
        @instance = Noop.new
      end

      should "leave alone the data pointer" do
        spy_processor = OpenStruct.new(data_pointer: 0)
        @instance.perform(spy_processor, [], [], ->{0}, ->value{})
        assert_equal 0, spy_processor.data_pointer
      end

      should "leave alone the instruction pointer" do
        spy_processor = OpenStruct.new(instruction_pointer: 0)
        @instance.perform(spy_processor, [], [], ->{0}, ->value{})
        assert_equal 0, spy_processor.instruction_pointer
      end

      should "leave alone the memory" do
        touched = false
        not_to_be_touched = [].freeze
        begin
          @instance.perform(Object.new, not_to_be_touched, [], ->{0}, ->value{})
        rescue
          touched = true
        end
        assert (not touched)
      end

      should "leave alone the program" do
        touched = false
        not_to_be_touched = [].freeze
        begin
          @instance.perform(Object.new, [], not_to_be_touched, ->{0}, ->value{})
        rescue
          touched = true
        end
        assert (not touched)
      end

      should "leave alone the input lambda" do
        invoked = false
        @instance.perform(Object.new, [], [], ->{ invoked = true }, ->value{})
        assert (not invoked)
      end

      should "leave alone the output lambda" do
        invoked = false
        @instance.perform(Object.new, [], [], ->{}, ->value{ invoked = true })
        assert (not invoked)
      end

    end

  end

end