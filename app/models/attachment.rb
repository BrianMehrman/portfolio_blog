class Attachment < ActiveRecord::Base

  belongs_to :user, :foreign_key => 'attacher_id'
  belongs_to :attachable, polymorphic: true

  validates_presence_of :user

  def self.get_attachable_types
    ['HtmlSnippet', 'Medium']
  end
end
