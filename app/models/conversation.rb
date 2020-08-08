class Conversation < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  belongs_to :receiver, class_name: 'User', foreign_key: 'receiver_id'
  
  has_many :messages, -> { order(created_at: :asc) }, dependent: :destroy
  has_and_belongs_to_many :users
  end
