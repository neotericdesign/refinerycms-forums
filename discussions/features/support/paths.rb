module NavigationHelpers
  module Refinery
    module Discussions
      def path_to(page_name)
        case page_name
        when /the list of discussions/
          admin_discussions_path

         when /the new discussion form/
          new_admin_discussion_path
        else
          nil
        end
      end
    end
  end
end
