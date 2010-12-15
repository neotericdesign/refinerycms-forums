class Admin::DiscussionsController < Admin::BaseController
  before_filter :get_topics, :except => :index
    
  crudify :discussion

  private
  
  def get_topics
    @topics = DiscussionTopic.all
  end
end
