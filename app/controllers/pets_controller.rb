class PetsController < ApplicationController
  # before_action :require_login
  before_action :authenticate_user!
  
  def index
    @pets = Pet.all
  end

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
    @pet = Pet.new(pet_params)
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