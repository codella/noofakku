module Noofakku

  class Brackets

    def initialize(open, closed)
      @open, @closed = open, closed
    end

    def perform(processor, memory, program, input, output)
      raise "processor cannot be nil" unless processor != nil
      raise "memory cannot be nil" unless memory != nil
      raise "program cannot be nil" unless program != nil
      value_at_data_pointer = memory[processor.data_pointer]
      this_bracket = program[processor.instruction_pointer]
      other_bracket = this_bracket != @open ? @open :  @closed
      if (value_at_data_pointer != 0 and this_bracket == @open) or (value_at_data_pointer == 0 and this_bracket == @closed)
        return
      end
      unmatched_brackets = 1
      pointer_to_current_instruction = processor.instruction_pointer
      direction = this_bracket == @open ? 1 : -1
      until unmatched_brackets == 0
      	processor.instruction_pointer += direction
      	if not (0...program.length).include? processor.instruction_pointer then raise "no matching bracket for that at #{pointer_to_current_instruction}"
      	elsif program[processor.instruction_pointer] == this_bracket then unmatched_brackets += 1
      	elsif program[processor.instruction_pointer] == other_bracket then unmatched_brackets -= 1
        end
      end
    end

  end

end