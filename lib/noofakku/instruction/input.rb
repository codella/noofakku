module Noofakku
  class Input
    def hook
      ','
    end

    def perform(processor, memory, program, input, output)
      raise "processor cannot be nil" unless processor != nil
      raise "memory cannot be nil" unless memory != nil
      raise "input cannot be nil" unless input != nil
      memory[processor.data_pointer] = input.call
    end
  end
end