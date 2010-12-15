require 'refinery'

module Refinery
  module DiscussionReplies
    class Engine < Rails::Engine
      initializer "static assets" do |app|
        app.middleware.insert_after ::ActionDispatch::Static, ::ActionDispatch::Static, "#{root}/public"
      end

      # config.after_initialize do
      #   Refinery::Plugin.register do |plugin|
      #     plugin.name = "discussion_replies"
      #     plugin.activity = {:class => DiscussionReply}
      #   end
      # end
    end
  end
end
