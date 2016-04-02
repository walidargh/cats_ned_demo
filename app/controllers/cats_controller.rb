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

	def create
		# POST /cats/
		# Content-Length: ...
		#
		#{ "cat": {"name": "Sally"}}
		cat = Cat.new(name: params[:cat][:name])
		if cat.save
			render json: cat
		else
			# raise "Hell"
			render json: cat.errors.full_messages, status: :unprocessable_entity
		end
	end


end
