class ConversationsController < ApplicationController
    before_action :get_messages

    def chat
        @message = Message.new
    end

    private

    def get_messages
        @messages = Message.display_in_order
    end
end