class Prev
  def hook
    '<'
  end

  def perform(processor, memory)
    processor.pointer -= 1;
  end
end