class CreateDiscussionReplies < ActiveRecord::Migration

  def self.up
    create_table :discussion_replies do |t|
      t.text :body
      t.integer :discussion_id
      t.integer :position

      t.timestamps
    end

    add_index :discussion_replies, :id

    load(Rails.root.join('db', 'seeds', 'discussion_replies.rb'))
  end

  def self.down
    UserPlugin.destroy_all({:name => "discussion_replies"})

    Page.delete_all({:link_url => "/discussion_replies"})

    drop_table :discussion_replies
  end

end
