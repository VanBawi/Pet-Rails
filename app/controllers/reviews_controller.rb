class ReviewsController < ApplicationController
    before_action :find_pet
    before_action :find_review, only: [:edit, :update, :destroy]
    before_action :authenticate_user!, only: [:new, :edit]

  # def new
  #   @pet = Pet.find(params[:pet_id])
  #   @review = Review.new
  # end

  def create
    @review = @pet.reviews.create(review_params)
    # @review.pet_id = @pet.id
    @review.user_id = current_user.id

    if @review.save
        redirect_to pet_path(@pet)
    else
        render 'new'
    end
  end

  # def show
  #   @reviews = @pet.reviews.to_a
  #   @avg_rating = if @reviews.blank?
  #     0
  #   else
  #     @pet.reviews.average(:rating).round(2)
  #   end
  # end

  def edit
    # @pet = Review.find(params[:id])
  end

  def update
    if @review.update(review_params)
      redirect_to pet_path(@pet)
    else
      render 'edit'
    end
  end

  def destroy
		@review.destroy
		redirect_to pet_path(@pet)
	end

  private
  
  def review_params
    params.require(:review).permit(:rating, :comment)
  end

  def find_pet
    @pet = Pet.find(params[:pet_id])
  end

  def find_review
    @review = @pet.reviews.find(params[:id])
  end

end
