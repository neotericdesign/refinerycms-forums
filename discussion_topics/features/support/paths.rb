module NavigationHelpers
  module Refinery
    module DiscussionTopics
      def path_to(page_name)
        case page_name
        when /the list of discussion_topics/
          admin_discussion_topics_path

         when /the new discussion_topic form/
          new_admin_discussion_topic_path
        else
          nil
        end
      end
    end
  end
end
