class CategoriesController < ApplicationController
	before_action :set_category, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!, except: [:index, :show]
	
	def index
		@categories = Category.all
	end

	def new
		@category = Category.new
	end
	def create
        @category=Category.new(category_params)
        if @category.save
            redirect_to categories_path
        else
        end
	end

	def show
	end

	def edit
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
		@category.destroy
		redirect_to categories_path
	end   
	private

	def category_params
	  params[:category].permit(:name,:description)
	end
    def set_category
	  @category = Category.find(params[:id])
	end 
end
