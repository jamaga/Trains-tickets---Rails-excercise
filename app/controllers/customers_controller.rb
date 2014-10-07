class CustomersController < ApplicationController
	def index
		@customers = Customer.all
	end


	def new 
		@customer = Customer.new
	end

	def create
			#creating new train with params from browser
		@customer = Customer.new(customer_params)

			#checking if train is saved to DB (if passes validations)
		if @customer.save
				redirect_to customers_url
		else
			#display the "new.html.erb" template with the @train var
			render :new
		end
	end

	def show
		@customer = Customer.find params[:id]
	end

	def edit
			#loading train from database with ID specified in the route (/trains/:id/edit)
			@customer = Customer.find(params[:id])
	end

	def destroy
		@customer = Customer.find(params[:id])
		@customer.destroy

		redirect_to customers_url
	end

	def update
			#get the train from the DB
			@customer = Customer.find(params[:id])
			#update the train with params from browser
			if @customer.update(customer_params)
				redirect_to customer_url
			else
				render :edit
			end
		end


	private  #security thing, which stuff we allow to the database, 
		#its only allowing these parameters from website - let user change only name of train, not sth different
		# only allow whitelisted params from the browser
		def customer_params
			params.require(:customer).permit(:name)
		end

end


