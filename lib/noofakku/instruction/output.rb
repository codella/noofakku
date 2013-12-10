class Output
  def hook
    '.'
  end

  def perform(processor, memory, program)
  	raise "a block returning a single character string must be given" unless block_given?
    raise "processor cannot be nil" unless processor != nil
    raise "memory cannot be nil" unless memory != nil
    yield memory[processor.data_pointer];
  end
end