require 'refinery'

module Refinery
  module Forums
    class Engine < Rails::Engine
      initializer "static assets" do |app|
        app.middleware.insert_after ::ActionDispatch::Static, ::ActionDispatch::Static, "#{root}/public"
      end

      config.after_initialize do
        Refinery::Plugin.register do |plugin|
          plugin.name = "forums"
          plugin.url = {:controller => 'admin/discussions'}
          plugin.menu_match = %r{(admin|refinery)/(forums|discussions)$}
          plugin.activity = {:class => Discussion}
        end
      end
    end
  end
  module DiscussionTopics
    class Engine < Rails::Engine
      initializer "static assets" do |app|
        app.middleware.insert_after ::ActionDispatch::Static, ::ActionDispatch::Static, "#{root}/public"
      end

      config.after_initialize do
        Refinery::Plugin.register do |plugin|
          plugin.name = "forum_topics"
          plugin.url = {:controller => "admin/discussion_topics"}
          plugin.menu_match = %r{(admin|refinery)/(forums|discussion)_topics$}
          plugin.activity = {:class => DiscussionTopic,
          :title => 'name'
        }
        end
      end
    end
  end
end
