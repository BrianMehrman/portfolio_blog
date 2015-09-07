class HtmlSnippet < ActiveRecord::Base
  # attr_accessible :css, :description, :html, :javascript, :name

  has_many :attachments, as: :attachable

  mount_uploader :image, ImageUploader

  def render(data)
    require "CanvasToImage"
    File.open("tmp/reply.png", "wb") { |f| f.write(CanvasToImage::decode_data_uri(data)[0]) }

# binding.pry
    file = File.open("tmp/reply.png", "r")
  end
end
