class HtmlSnippet < ActiveRecord::Base
  attr_accessible :css, :description, :html, :javascript, :name

  has_many :attachments, as: :attachable

  has_attached_file :image
end
