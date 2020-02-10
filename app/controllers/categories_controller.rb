class CategoriesController < ApplicationController
    def index
		@categories = Category.all
	end

	def new
		@category = Category.new
	end
	def create
        @category=Category.new
        @category.name = params["category"]["name"]
        @category.description = params["category"]["description"]
        if @category.save
            redirect_to categories_path
        else
        end
	end

	def show
		@category = Category.find(params[:id])

	end

	def edit
		@category = Category.find(params[:id])
		@categories = Category.all
	end

	def update
		@category = Category.find(params[:id])
		@category.name = params['category']['name']
		@category.description = params['category']['description']
		if @category.save
		  redirect_to categories_path
		end
	end
	def destroy
		@category = Category.find(params[:id])
		@category.destroy
		redirect_to categories_path
	end    
end
