class Messages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.integer :author_id, foreign_key: true
      t.integer :receiver_id, foreign_key: true
      t.string :body

      t.timestamps
    end
  end
end

