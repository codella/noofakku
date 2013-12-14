require 'noofakku/instruction/open_bracket'
require 'noofakku/instruction/closed_bracket'
require 'noofakku/instruction/inc'
require 'noofakku/instruction/dec'
require 'noofakku/instruction/prev'
require 'noofakku/instruction/next'
require 'noofakku/instruction/input'
require 'noofakku/instruction/output'
require 'noofakku/processor'

module Noofakku
  class VM
    def self.start(program, input, output)
    	processor = Processor.new(Hash.new(Noop.new).merge!({
      	'>' => Next.new,
      	'<' => Prev.new,
      	'+' => Inc.new,
      	'-' => Dec.new,
      	'.' => Output.new,
      	',' => Input.new,
      	'[' => OpenBracket.new('[', ']'),
      	']' => ClosedBracket.new('[', ']')
      }))
      processor.run(program.clone.freeze, Array.new(30_000, 0), input, output)
    end
  end
end
