class MessagesController < ApplicationController
	before_action :single_message, only: [:show, :edit, :update, :destroy]

	def index
		@messages = Message.all
	end

	def show
	end

	def edit
	end

	def new
		@message = Message.new
		@company = Company.find(params[:company_id])
	end

	def create
		@message = Message.new(message_params)
		save(@message)
	end

	def update
		@message = Message.update(message_params)
		save(@message)
	end

	 def destroy
    @message.destroy
      redirect_to companies_path
  end

	private

	def save(message)
		if message.save
			redirect_to message.company
		else
			render :new
		end
	end

	def single_message
		@message = Message.find(params[:id])
	end

	def message_params
		params.require(:message).permit(:body, :author, :company_id)
	end
end 