module Noofakku

  class Output

    def perform(processor, memory, program, input, output)
      raise "processor cannot be nil" unless processor != nil
      raise "memory cannot be nil" unless memory != nil
      raise "output cannot be nil" unless output != nil
      output.call(memory[processor.data_pointer])
    end

  end

end