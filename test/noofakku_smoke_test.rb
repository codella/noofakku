require 'test/unit'
require 'noofakku'
require 'shoulda'
require 'ostruct'

module Noofakku

  class VMTest < Test::Unit::TestCase

    context 'Execution' do

      should 'produce "Hello World" in output' do
		input = -> { 0 }
		produced = ''
		output = ->value { produced << value }
		program = '++++++++++[>+++++++>++++++++++>+++>+<<<<-]>++.>+.+++++++..+++.>++.<<+++++++++++++++.>.+++.------.--------.>+.>.'
		Noofakku::VM.start(program, input, output)
        assert_equal "Hello World!\n", produced
      end

      should 'produce Fibonacci numbers in output' do
      	program = '+.>+.>>>++++++++++[<<<[->>+<<]>>[-<+<+>>]<<<[->+<]>>[-<<+>>]<.>>>-]'
      	input = -> { 0 }
		produced = []
		output = ->value { produced << value }
		Noofakku::VM.start(program, input, output)
		assert_equal [1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144], produced
      end

      should 'order numbers in input' do
      	program = '>>,[>>,]<< [[-<+<]>[>[>>]<[.[-]<[[>>+<<-]<]>>]>]<<]'
      	to_be_sorted = [5, 3, 2, 6, 0].each
      	input = -> { to_be_sorted.next }
		produced = []
		output = ->value { produced << value }
		Noofakku::VM.start(program, input, output)
		assert_equal [2, 3, 5, 6], produced
      end

    end

  end

end