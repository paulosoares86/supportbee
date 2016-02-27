class SupportBee
  def execute(*args)
    args << @base_uri
    args
  end
end
