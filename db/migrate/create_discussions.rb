class CreateDiscussions < ActiveRecord::Migration

  def self.up
    create_table :discussions do |t|
      t.string :title
      t.text :body
      t.integer :topic_id
      t.integer :position
      t.boolean :closed
      t.string :closed_by

      t.timestamps
    end

    add_index :discussions, :id

    load(Rails.root.join('db', 'seeds', 'discussions.rb'))
  end

  def self.down
    UserPlugin.destroy_all({:name => "discussions"})

    Page.delete_all({:link_url => "/discussions"})

    drop_table :discussions
  end

end
