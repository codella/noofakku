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
      assert_raise (RuntimeError) { @instance.perform(nil, nil, Object.new) }
    end

    should "should increment memory data pointer" do
      spy_processor = OpenStruct.new
      spy_processor.data_pointer = 0
      @instance.perform(spy_processor, nil, nil)
      assert_equal 1, spy_processor.data_pointer
    end

  end

end