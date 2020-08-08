class AddUsersToConversation < ActiveRecord::Migration[6.0]
  def change
    change_table :conversations do |t|
      t.integer :author_id, index: { unique: true }, foreign_key: true
      t.integer :receiver_id, index: { unique: true }, foreign_key: true
    end
  end
end
