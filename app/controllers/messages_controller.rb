class MessagesController < ApplicationController
    before_action :set_users

    def create
        message = Message.new(author_id: @admin.id, receiver_id: @bot.id, body: message_params[:body] )
        if message.save!
            redirect_to root_path and return
        end
    end

    private

    def set_users
        @admin = User.find_by({ name: 'admin'})
        @bot = User.find_by({ name: 'bot' })
    end

    def message_params
        params.require(:message).permit(:body)
    end
end
