module Noofakku

  class ClosedBracket

    def initialize(open, closed)
      @open, @closed = open, closed
    end

    def perform(processor, memory, program, input, output)
      raise "processor cannot be nil" unless processor != nil
      raise "memory cannot be nil" unless memory != nil
      raise "program cannot be nil" unless program != nil
      raise "instruction pointer must point to a '#{@closed}'" unless program[processor.instruction_pointer] == @closed
      if memory[processor.data_pointer] == 0 then return end
      unmatched_brackets = 1
      pointer_to_current_instruction = processor.instruction_pointer
      until unmatched_brackets == 0
      	processor.instruction_pointer -= 1
      	if processor.instruction_pointer == -1 then raise "no matching '#{@open}' for '#{@closed}' at #{pointer_to_current_instruction}"
      	elsif program[processor.instruction_pointer] == @closed then unmatched_brackets += 1
      	elsif program[processor.instruction_pointer] == @open then unmatched_brackets -= 1
        end
      end
    end

  end

end