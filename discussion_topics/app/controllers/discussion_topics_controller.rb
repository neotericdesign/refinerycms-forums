class DiscussionTopicsController < ApplicationController

  before_filter :find_all_discussion_topics
  before_filter :find_page

  def index
    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @discussion_topic in the line below:
    present(@page)
  end

  def show
    @topic = DiscussionTopic.find(params[:id])

    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @discussion_topic in the line below:
    present(@page)
  end

protected

  def find_all_discussion_topics
    @topics = DiscussionTopic.all
  end

  def find_page
    @page = Page.find_by_link_url("/discussion_topics")
  end

end
