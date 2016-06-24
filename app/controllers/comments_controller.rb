class CommentsController < ApplicationController
	def index
		@comments = Comment.all

	end
	def create
		
		@comments = Comment.create comment_params 
		# @product = Product.find_by_id(params[:])
		puts "^^^^^^^^^^^^^^^"
		puts @comments
		@comments.save
		puts "&&&&&&&&&&&&&&"
		# puts @product
		redirect_to "/products/show/#{params[:comment][:product_id]}"
	end

	private

	def comment_params
		# params[:product_id]
		# params[:comment][:product_id]
		params.require(:comment).permit(:comment, :product_id)
	end
	# def product_params
	# 	params.require(:product).permit(:name, :description, :pricing, :category_id)
	# end
end
