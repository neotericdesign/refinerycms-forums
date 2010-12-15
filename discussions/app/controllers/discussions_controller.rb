class DiscussionsController < ApplicationController

  before_filter :find_all_topics
  before_filter :find_page, :except => [:new, :edit, :create, :update]

  def index
    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @discussion in the line below:
    present(@page)
  end

  def show
    @discussion = Discussion.find(params[:id])

    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @discussion in the line below:
    present(@page)
  end
  
  def open_or_close
    @discussion = Discussion.find(params[:id])
    if @discussion.open_or_close(current_user)
      verb = @discussion.closed ? 'closed' : 'open'
      redirect_to topic_discussion_path(@discussion.topic, @discussion), :notice => "Discussion is now #{verb}"
    else
      redirect_to topic_discussion_path(@discussion.topic, @discussion), :notice => "Eh, something went wrong there."
    end
  end
  
  def new
    @topic = DiscussionTopic.find(params[:topic_id])
    @discussion = @topic.discussions.build
  end
  
  def edit
  end
  
  def create
    @discussion = Discussion.new(params[:discussion])
    @topic = @discussion.topic
    if @discussion.save
      redirect_to topic_discussion_path(@topic, @discussion), :notice => 'Thanks for posting!'
    else
      render :action => :new
    end
  end
  
  def update
  end

protected
  
  def find_all_topics
    @topics = DiscussionTopic.includes(:discussions).all
  end

  def find_page
    @page = Page.find_by_link_url("/discussions")
  end

end
