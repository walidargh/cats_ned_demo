class ToysController < ApplicationController
	def index
		# /cats/:cat_id/toys
		cat = Cat.find(params[:cat_id])
		render json: cat.toys
	end

	def show
		# /cats/:cat_id/toy/:id
		# /toys/:id preferred
		render json: Toy.find(params[:id])
	end

	def destroy
		# /toys/:id
		toy = Toy.find(parmas[:id])
		toy.destroy
		render json: toy
	end

	def update
		# /toys/:id
		toy = Toy.find(params[:id])
		if toy.update(toy_params)
			render json: toy
		else
			render json: toy.errors.full_messages, status: :unprocessable_entity
		end
	end

	def create
		# toy = Toy.new(cat_id: params[:toy][:cat_id], name: params[:toy][:name], ttype: params[:toy][:ttype])
		# POST /cats/:cat_id/toys/
		# POST /toys

		@toy = Toy.new(toy_params)
		@cat = @toy.cat
		# toy.cat_id = params[:cat_id]
		if @toy.save
			redirect_to cat_url(@cat)
		else
			# render json: toy.errors.full_messages, status: :unprocessable_entity
			render :new
		end
	end

	def new
		@cat = Cat.find(params[:cat_id])
		@toy = Toy.new
		render
	end


	def update
		toy = Toy.find(params[:id])
		if toy.update(toy_params)
			render json: toy
		else
			render json: toy.errors.full_messages,
			status: :unprocessable_entity
		end
	end

	private

	def toy_params
		self.params.require(:toy).permit(:cat_id, :name, :ttype)
	end

end
