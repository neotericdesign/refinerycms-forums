class DiscussionRepliesController < ApplicationController
  before_filter :find_topic_and_discussion
  
  def new
    @discussion_reply = @discussion.replies.build
  end
  
  def edit
  end
  
  def create
    @discussion_reply = @discussion.replies.new(params[:discussion_reply])
    if @discussion_reply.save
      redirect_to topic_discussion_path(@topic, @discussion, :anchor => dom_id(@discussion_reply)), :notice => "Thanks for your reply!"
    else
      render :action => :new
    end
  end
  
  def update
  end
  
  def destroy
  end
  
  private
  
  def find_topic_and_discussion
    @topic = DiscussionTopic.find(params[:topic_id])
    @discussion = Discussion.find(params[:discussion_id])
  end

end
