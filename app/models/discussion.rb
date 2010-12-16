class Discussion < ActiveRecord::Base

  acts_as_indexed :fields => [:title, :body]
  
  default_scope :order => 'created_at DESC'
  
  validates_presence_of :title
  validates_presence_of :body
  validates_acceptance_of :terms
  
  has_friendly_id :title, :use_slug => true
  
  belongs_to :topic, :class_name => 'DiscussionTopic'
  has_many :replies, :class_name => 'DiscussionReply'
  
  def allows_replies?
    not closed
  end
  
  def open_or_close(user)
    closed_by = self.closed ? nil : (user.has_role?('Superuser') ? 'a moderator' : 'the original poster')
    self.update_attributes({
      :closed => !self.closed,
      :closed_by => closed_by
    })
  end
end
