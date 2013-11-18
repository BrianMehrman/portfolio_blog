class Medium < ActiveRecord::Base
  attr_accessible :description, :file, :media_type, :name

  has_many :attachments, as: :attachable

  has_attached_file :file
end
