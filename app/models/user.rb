class User < ApplicationRecord
  has_many :authored_messages, class_name: 'Message', foreign_key: 'author_id'
  has_many :received_messages, class_name: 'Message', foreign_key: 'receiver_id'

  has_and_belongs_to_many :conversations, dependent: :destroy
  has_many :messages, through: :conversation
end
