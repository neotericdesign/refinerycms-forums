class DiscussionReply < ActiveRecord::Base

  acts_as_indexed :fields => [:body]
  
  default_scope :order => 'created_at ASC'
  
  validates_presence_of :body
  validates_acceptance_of :terms
  
  belongs_to :discussion
  
  # def title was created automatically because you didn't specify a string field
  # when you ran the refinery_engine generator. Love, Refinery CMS.
  def title
    ""
  end
  
end
