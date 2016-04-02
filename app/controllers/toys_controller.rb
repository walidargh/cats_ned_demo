class ToysController < ApplicationController
	def index
		render json: Toy.all
	end

	def show
		render json: Toy.find(params[:id])
	end

	def create
		toy = Toy.new(cat_id: params[:toy][:cat_id], name: params[:toy][:name], ttype: params[:toy][:ttype])

		if toy.save
			render json: toy
		else
			render json: toy.error.full_messages, status: :unprocessable_entity
		end
	end

	def destroy
		toy = Toy.find(parmas[:id])
		toy.destroy
		render json: toy
	end

	def update
		toy = Toy.find(params[:id])
		if toy.update()
			render json: toy
		else
			render json: toy.errors.full_messages,
			status: :unprocessable_entity
		end
	end

	private

	def toy_params
		self.params.permit(:toy).require(:cat_id, :name, :ttype)

end
