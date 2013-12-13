module Noofakku

  class Processor

    attr_accessor :instruction_pointer, :data_pointer
  	
  	def initialize(instruction_to_handler)
      raise "instruction_to_handler cannot be nil" unless instruction_to_handler != nil
      @instruction_to_handler = instruction_to_handler
      @instruction_pointer = @data_pointer = 0
  	end

  	def run(program, memory, input, output)
      raise "program cannot be nil" unless program != nil
      raise "memory cannot be nil" unless memory != nil
      raise "input cannot be nil" unless input != nil
      raise "output cannot be nil" unless output != nil
      while (0...program.length).include? @instruction_pointer
        instruction = @instruction_to_handler[program[@instruction_pointer]]
        instruction.perform(self, memory, program, input, output)
        @instruction_pointer += 1
      end 
  	end

  end

end