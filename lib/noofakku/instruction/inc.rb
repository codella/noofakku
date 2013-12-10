class Inc
  def hook
    '+'
  end

  def perform(processor, memory, program)
    raise "processor cannot be nil" unless processor != nil
    raise "memory cannot be nil" unless memory != nil
    memory[processor.data_pointer] += 1;
  end
end