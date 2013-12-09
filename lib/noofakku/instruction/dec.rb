class Dec
  def hook
    '-'
  end

  def perform(processor, memory)
    raise "processor cannot be nil" unless processor != nil
    raise "memory cannot be nil" unless memory != nil
    memory[processor.pointer] -= 1;
  end
end