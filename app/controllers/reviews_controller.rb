class ReviewsController < ApplicationController
	before_action :set_review, only: [:show, :edit, :update, :destroy]

  def index
  	@reviews = Review.all
  end

  def show
  	@review = Review.find(params[:id])
  end

  def new
  	@review = Review.new
  end

  def create
  	@review = Review.new(review_params)

  	if @review.save
  		redirect_to reviews_path
  	else
  		render :new
  	end
  end

  def edit
  	@review = Review.find(params[:id])
  end
  
  def update
  	@review = Review.find(params[:id])

  	if @review.update_attributes(review_params)
  		redirect_to reviews_path
  	else
  		render :edit
  	end
  end

  def destroy
  	@review = Review.find(params[:id])
  	@review.destroy
  	redirect_to reviews_path
  end
  
  private

  def review_params
  	params.require(:review).permit(:name, :rating, :body)
  end

  def set_review
  	@review = Review.find(params[:id])
  end
end
