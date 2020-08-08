class Users < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :chat_id
      t.string :name
      t.timestamps
    end
  end
end
