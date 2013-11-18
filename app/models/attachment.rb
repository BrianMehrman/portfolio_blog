class Attachment < ActiveRecord::Base
  attr_accessible :attachable_id, :attachable_type, :attacher_id, :post_id, :slug_name

  belongs_to :user, :foreign_key => 'attacher_id'
  belongs_to :attachable, polymorphic: true

  def self.get_attachable_types
    ['HtmlSnippet', 'Medium']
  end
end
