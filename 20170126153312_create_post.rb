class CreatePost < ActiveRecord::Migration[5.0]
def self.up
    # создание таблицы с заданными полями
    create_table :posts do |post|
      post.string   :title
      post.text     :content
      post.timestamps
    end
    # тестовые записи
    Post.create(title: "Example Post",
                content: "Content of my first post")
    Post.create(title: "Second Post",
                content: "Content of my second post")
  end
  def self.down
    # откатить миграцию (rake:db rollback)
    drop_table :posts
  end
end
