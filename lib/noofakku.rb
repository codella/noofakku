require 'noofakku/instruction/brackets'
require 'noofakku/instruction/inc'
require 'noofakku/instruction/dec'
require 'noofakku/instruction/prev'
require 'noofakku/instruction/next'
require 'noofakku/instruction/input'
require 'noofakku/instruction/output'
require 'noofakku/instruction/noop'
require 'noofakku/processor'

module Noofakku
  class VM
    def self.start(program, input, output)
      brackets = Brackets.new('[', ']')
    	processor = Processor.new(Hash.new(Noop.new).merge!({
      	'>' => Next.new,
      	'<' => Prev.new,
      	'+' => Inc.new,
      	'-' => Dec.new,
      	'.' => Output.new,
      	',' => Input.new,
      	'[' => brackets,
      	']' => brackets
      }))
      processor.run(program.clone.freeze, Array.new(30_000, 0), input, output)
    end
  end
end
