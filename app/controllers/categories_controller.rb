class CategoriesController < ApplicationController
	def index
		@category = Category.all
		@data = "some data"
		puts "***********"
		puts @category
		# redirect_to product_new_path
		# redirect_to "/products/"+params[:product][:product_id]
		redirect_to "/products/new"
	end

	private
	def category_params
		params.require(:category).permit(:name)
	end

end