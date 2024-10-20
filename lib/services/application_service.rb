class ApplicationService
  def initialize(*args, **kwargs, &block)
    super
  end 

  def self.call(...)
    new(...).call
  end

  def call
    run
  end

  private

  def run
    raise "Must implement private method run"
  end
end