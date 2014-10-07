class TrainsController < ApplicationController
	def index

		#create a variable to use in the view:
		# x = 1
		# y = 2
		# @z = x + y
	
	#rails g model train
#@train = Train.create - creates train in the database


	#rails g migration addThingsToTrain name:string
	# rake db:migrate


	#change a trains name and save to the DB:
		#@train = Train.last
		#@train.name = "blue train"
		#@train.save


		# get the latest train:
		@trains = Train.all
end

		def show
			#get the train from the DB
			@train = Train.find params[:id]
		end

		def new
			#create new train without saving to DB
			@train = Train.new
		end

		def edit
			#loading train from database with ID specified in the route (/trains/:id/edit)
			@train = Train.find(params[:id])
		end

		#these dont usually have a view
		def update
			#get the train from the DB
			@train = Train.find(params[:id])
			#update the train with params from browser
			if @train.update(train_params)
				redirect_to trains_url
			else
				render :edit
			end
		end

		def create
			#creating new train with params from browser
			@train = Train.new(train_params)

			#checking if train is saved to DB (if passes validations)
			if @train.save
				redirect_to trains_url
			else
			#display the "new.html.erb" template with the @train var
				render :new
			end
		end

		def destroy
			@train = Train.find(params[:id])
			@train.destroy

			redirect_to trains_url
		end

		private  #security thing, which stuff we allow to the database, 
		#its only allowing these parameters from website - let user change only name of train, not sth different
		# only allow whitelisted params from the browser
		def train_params
			#params = {
			#train: {name: "the name", origin: "ORI", admin: true} if you have admin param - its important to protect that, security
			#id: 3
			# utf8: "J"
		#}

		#if u want to permit to access everything - u can write: (params)permit!
			params.require(:train).permit(:name, :origin, :destination, :capacity, :time)

		end
end
