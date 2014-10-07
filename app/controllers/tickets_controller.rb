class TicketsController < ApplicationController
  def index
  	@tickets = Ticket.all
  end

  def show
  	@ticket = Ticket.find params[:id]
  end

	def new
		@ticket = Ticket.new
	end

	def edit
		@ticket = Ticket.find params[:id]
	end

	def create
		@ticket = Ticket.new(ticket_params)
			if @ticket.save
				redirect_to tickets_url
			else
				render :new
			end
	end

	def update
		@ticket = Ticket.find(params[:id])
			if @ticket.update_attributes(ticket_params)
			redirect_to tickets_url
				else
				render :edit
			end
	end

private 
		def ticket_params
		 params.require(:ticket).permit(:customer_id, :train_id)
		end
end
