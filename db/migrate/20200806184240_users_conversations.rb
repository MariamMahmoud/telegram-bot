class UsersConversations < ActiveRecord::Migration[6.0]
  def change
    create_table :users_conversations, id: false do |t|
      t.belongs_to :user
      t.belongs_to :conversation
    end
  end
end
