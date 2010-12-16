class DiscussionTopic < ActiveRecord::Base

  acts_as_indexed :fields => [:name]
  
  default_scope :order => :name
  
  validates_presence_of :name
  validates_uniqueness_of :name
  
  has_friendly_id :name, :use_slug => true
  
  has_many :discussions, :foreign_key => 'topic_id'
  
end
