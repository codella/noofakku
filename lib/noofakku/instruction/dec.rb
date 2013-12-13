module Noofakku
  class Dec
    def hook
      '-'
    end

    def perform(processor, memory, program, input, output)
      raise "processor cannot be nil" unless processor != nil
      raise "memory cannot be nil" unless memory != nil
      memory[processor.data_pointer] -= 1
    end
  end
end