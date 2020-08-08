require 'telegram/bot'

class MessagesController < ApplicationController
    before_action :set_users
    skip_before_action :verify_authenticity_token

    def create
        @message = Message.new(author_id: 2, receiver_id: 1, body: message_params[:body])
        if @message.save!
            byebug
            @bot.send_message(chat_id: 1196321561, text: @message.body)
            redirect_to root_path and return
        end
    end

    def get_commands
        message = JSON.parse(request.body.read)
        @message = Message.new(author_id: 1, receiver_id: 2, body: message["message"]["text"] )
        if @message.save!
            redirect_to root_path and return
        end
      end

    private

    def set_users
        @admin = User.find_by({ name: 'bot'})
        @user = User.find_by({ name: 'user' })
        @bot = Telegram::Bot::Client.new('1307245320:AAG9ozaRNAPn076uHb0N6YZG-aGj-W4_kxw')
    end

    def message_params
        params.require(:message).permit(:body)
    end
end
