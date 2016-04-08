class CreateChats < ActiveRecord::Migration
  def change
    create_table :chats do |t|
      t.references :user, index: true, foreign_key: true
      t.integer :assigned_to_id
      t.string :title
      t.text :content
      t.boolean :closed, default: false

      t.timestamps
    end
  end
end
