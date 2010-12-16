class Admin::DiscussionTopicsController < Admin::BaseController

  crudify :discussion_topic,
          :title_attribute => 'name'


end
