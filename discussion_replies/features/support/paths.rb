module NavigationHelpers
  module Refinery
    module DiscussionReplies
      def path_to(page_name)
        case page_name
        when /the list of discussion_replies/
          admin_discussion_replies_path

         when /the new discussion_reply form/
          new_admin_discussion_reply_path
        else
          nil
        end
      end
    end
  end
end
