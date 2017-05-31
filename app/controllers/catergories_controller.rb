class CatergoriesController < ApplicationController
	def index
    @categories = Category.all
  end
  def show
    @category = Category.find(params[:id])
    @posts = @category.post
  end

  def create
   		@category=Category.new(category_params) 
        # if the category is saved successfully than respond with json data and status code 201
        if @category.save 
    		redirect_to catergory_path, :notice => "Your Category is saved"
  	 	else
    		render "new"
   		end
  	end
  	
  	private
  	def category_params
   		params.require(:category).permit(:name)
  	end
end
