class ApplicationService
  def call
    raise NotImplementedError
  end

  class << self
    def call(*args)
      new(*args).call
    end
  end
end
