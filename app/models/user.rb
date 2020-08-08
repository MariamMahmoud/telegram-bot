class User < ApplicationRecord
  has_many :messages, class_name: 'Message', foreign_key: 'author_id'
  has_many :received_messages, class_name: 'Message', foreign_key: 'receiver_id'

end
