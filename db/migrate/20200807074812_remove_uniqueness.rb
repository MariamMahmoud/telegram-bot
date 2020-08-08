class RemoveUniqueness < ActiveRecord::Migration[6.0]
  def change
    change_table :conversations do |t|
      t.integer :author_id foreign_key: true
      t.integer :receiver_id foreign_key: true
    end

    change_table :messages do |t|
      t.integer :author_id foreign_key: true
      t.integer :receiver_id foreign_key: true
      t.belongs_to :conversation, foreign_key: true

    end
  end
end
