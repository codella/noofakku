module Noofakku
  class OpenBracket
    def hook
      '['
    end

    def perform(processor, memory, program)
      raise "processor cannot be nil" unless processor != nil
      raise "memory cannot be nil" unless memory != nil
      raise "program cannot be nil" unless program != nil
      raise "instruction pointer must point to a '#{hook}'" unless program[processor.instruction_pointer] == hook
      if memory[processor.data_pointer] != 0 then return end
      unmatched_brackets = 1
      pointer_to_current_instruction = processor.instruction_pointer
      until unmatched_brackets == 0
      	processor.instruction_pointer += 1
      	if processor.instruction_pointer == program.length then raise "no matching ']' for '[' at #{pointer_to_current_instruction}"
      	elsif program[processor.instruction_pointer] == hook then unmatched_brackets += 1
      	elsif program[processor.instruction_pointer] == "]" then unmatched_brackets -= 1
        end
      end
    end
  end
end