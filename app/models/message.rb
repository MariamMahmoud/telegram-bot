
class Message < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  belongs_to :receiver, class_name: 'User', foreign_key: 'receiver_id'

  validates :body, presence: true

  scope :display_in_order, -> { order(:created_at).last(15) }
end
