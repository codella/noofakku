require 'test/unit'
require 'noofakku/instruction/next'
require 'shoulda'
require 'ostruct'

class NextTest < Test::Unit::TestCase

  context "Hook" do

    should "return '>' as hook character" do
      assert_equal ">", Next.new.hook
    end

  end

  context "Execution" do

    setup do
      @instance = Next.new
    end

    should "should throw on nil processor" do
      assert_raise (RuntimeError) { @instance.perform(nil, nil) }
    end

    should "should increment memory pointer" do
      spy_processor = OpenStruct.new
      spy_processor.pointer = 0
      @instance.perform(spy_processor, nil)
      assert_equal 1, spy_processor.pointer
    end

  end

end