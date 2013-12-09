class Prev
  def hook
    '<'
  end

  def perform(processor, memory)
  	raise "processor cannot be nil" unless processor != nil
    processor.pointer -= 1;
  end
end