class ProductsController < ApplicationController
	def index
		@product = Product.all
	end
	def new
		@category = Category.all
		render "new"
	end
	def create
		@product = Product.create product_params 
		redirect_to "/products"
	end
	def show
		@comment =  Comment.all.where(product_id: params[:id])
  		@product = Product.find_by_id(params[:id])
	end
	def edit
		@product = Product.find_by_id(params[:id])
		@category = Category.all
	end
	def update
		@product = Product.find_by_id(params[:id]).update product_params
  		redirect_to "/products"
	end
	  def destroy
	  	@product = Product.delete(params[:id])
	  	redirect_to "/products"
	  end

	private

	def product_params
		params.require(:product).permit(:name, :description, :pricing, :category_id)
	end

	def category_params
		params.require(:category).permit(:name)
	end


end