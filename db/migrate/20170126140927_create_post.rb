class CreatePost < ActiveRecord::Migration[5.0]
  def self.up
  # creation table and field
  create_table :posts do |post|
    post.string   :title
    post.text     :content
    post.references :user, index: true
    post.timestamps
  end
end

 def self.down
    # migration roll back (rake:db rollback)
    drop_table :posts
  end
end
