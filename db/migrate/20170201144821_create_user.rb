class CreateUser < ActiveRecord::Migration[5.0]
  def self.up
    # создание таблицы с заданными полями
    create_table :users do |user|
      user.string  :name
    end

  end
  def self.down
    # откатить миграцию (rake:db rollback)
    drop_table :users
  end
end
