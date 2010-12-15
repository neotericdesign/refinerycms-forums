class CreateDiscussionTopics < ActiveRecord::Migration

  def self.up
    create_table :discussion_topics do |t|
      t.string :name
      t.integer :position

      t.timestamps
    end

    add_index :discussion_topics, :id

    load(Rails.root.join('db', 'seeds', 'discussion_topics.rb'))
  end

  def self.down
    UserPlugin.destroy_all({:name => "discussion_topics"})

    Page.delete_all({:link_url => "/discussion_topics"})

    drop_table :discussion_topics
  end

end
