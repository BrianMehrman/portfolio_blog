class AttachmentContext
  attr_accessor :attachment

  def self.call(*args)
    new args
  end
  def initialize(*args)
    @attachment = args[:attachment]
  end

end
