class PetsController < ApplicationController
  # before_action :require_login
  before_action :authenticate_user!
  

  def index
    # search = params[:title].present? ? params[:title] : nil
    @pets = Pet.all
  end

  # def autocomplete
  #   render json: Pet.search(params[:query], {
  #     fields: ["title^5", "description"],
  #     match: :word_start,
  #     limit: 10,
  #     load: false,
  #     misspellings: {below: 5}
  #   }).map(&:title)
  # end

  def new
    @pet = Pet.new
  end

  def edit
    @pet = Pet.find(params[:id])
  end

  def show
    @pet= Pet.find(params[:id])
  end

  def create

    # byebug
    @pet = Pet.new(pet_params)
    @pet.user_id = current_user.id
    if(@pet.save)
      redirect_to pets_path(@pets)
    else
       @errors = @pet.errors.full_messages
      render 'new'
    end
  end

  def update
    @pet = Pet.find(params[:id])
    if (@pet.update(pet_params))
    redirect_to pets_path(@pets)
    else
      @errors = @pet.errors.full_messages
      render 'edit'
    end
  end

  def destroy
    @pet = Pet.find(params[:id])
    @pet.destroy
    redirect_to pets_path(@pets)

  end

  private 
  def pet_params
    params.require(:pet).permit(:title, :description, :picture, images:[])
  end
end
# , notice:"Pet created!"