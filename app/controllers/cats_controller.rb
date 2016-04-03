class CatsController < ApplicationController
	def index
		#GET /cats
		# app/views/cat/index.html
		@cats = Cat.all
		render :index
	end

	def show
		#GET /cats/123
		@cat = Cat.find(params[:id ])
		render :show
	end

	# 1. GET request for blank /cats/new form
	# 2. POST to /cats
	# 3. Validation fails
	# 4. Server renders the new template again.
	# 5. The form is filled in with @cat data

	def create
		# POST /cats/
		# Content-Length: ...
		#
		#{ "cat": {"name": "Sally"}}
		@cat = Cat.new(params[:cat].permit(:name, :skill))
		if @cat.save
			# render json: cat
			# render :show
			redirect_to cat_url(@cat)
		else
			# raise "Hell"
			# render json: @cat.errors.full_messages, status: :unprocessable_entity
			render :new
		end
	end

	# 1. GET /cats/new to fetch a new form
	# 2. User fills out form, clicks submit
	# 3. POST /cats the data in the form
	# 4. Create action is invoked, cat is created
	# 5. Send client a redirect to /cats/#{id}
	# 6. Client makes a GET request for /cats/#{id}
	# 7. Show action for newly created cat is invoked

	def new
		# /cats/new
		@cat = Cat.new
		render :new
	end

	def update
		# cats/:id/edit
	end

	def edit
	end

	def destroy
		# DELETE /cats/:id
		cat = Cat.find(params[:id])
		cat.destroy
		redirect_to cats_url

		# 1. GET /cats
		# 2. Click delete button
		# 3. Sends POST to /cats/123, but _method="DELETE" so  rails understands to do
		# 	a destroy
		# 4. Destroys the cat. Issues the redirect to the client.
		# 5. Client GETS /cats
	end
end
