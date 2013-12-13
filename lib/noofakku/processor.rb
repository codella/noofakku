require 'noofakku/instruction/open_bracket'
require 'noofakku/instruction/closed_bracket'
require 'noofakku/instruction/inc'
require 'noofakku/instruction/dec'
require 'noofakku/instruction/prev'
require 'noofakku/instruction/next'
require 'noofakku/instruction/input'
require 'noofakku/instruction/output'

module Noofakku

  class Processor
  	
  	def initialize(instructions)
      raise "instructions cannot be nil" unless instructions != nil
      @instructions = instructions
      @instruction_pointer = @data_pointer = 0
  	end

  	def run(program, memory, input, output)
      raise "program cannot be nil" unless program != nil
      raise "memory cannot be nil" unless memory != nil
      raise "input cannot be nil" unless input != nil
      raise "output cannot be nil" unless output != nil
      while (0...program.length).include? @instruction_pointer
        instruction = @instructions[program[@instruction_pointer]]
        instruction.perform(self, memory, program, input, output)
        @instruction_pointer += 1
      end 
  	end

  end

end