class CreateDatabaseTasks < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email, null: false
      t.string :username, null: false
      t.string :password_digest, null: false
      t.timestamps
    end

    create_table :votes do |t|
      t.integer :up_down, null: false
      t.integer :content_id, null: false,
      t.string :content_type, null: false
      t.timestamps
    end

    add_foreign_key :votes, :users

    create_table :questions do |t|
      t.string :title, null: false
      t.text :text, null: false
      t.timestamps
    end

    add_foreign_key :questions, :users

    create_table :answers do |t|
      t.string :title, null: false
      t.text :text, null: false
      t.boolean :best_answer
      t.integer :question_id, null: false
      t.timestamps
    end

    add_foreign_key :answers, :users
    add_foreign_key :questions, :answers

    create_table :comments do |t|
      t.text :text, null: false
      t.timestamps
    end

    add_foreign_key :comments, :users

    create_table :tags do |t|
      t.string :text, null: false
      t.timestamps
    end

    create_join_table :questions, :tags
  end
end
