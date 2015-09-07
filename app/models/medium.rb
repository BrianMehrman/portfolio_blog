## Medium as in the type of media used to create a work of art.
class Medium < ActiveRecord::Base
  # attr_accessible :description, :file, :media_type, :name

  has_many :attachments, as: :attachable

  mount_uploader :file, FileUploader

end
