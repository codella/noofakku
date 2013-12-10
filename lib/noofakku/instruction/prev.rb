class Prev
  def hook
    '<'
  end

  def perform(processor, memory, program)
    raise "processor cannot be nil" unless processor != nil
    processor.data_pointer -= 1;
  end
end