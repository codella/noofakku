module Noofakku
  class VM
    def self.start(program, input, output)
      Processor.new(program, Arary.new(30_000, 0), input, output).start
    end
  end
end