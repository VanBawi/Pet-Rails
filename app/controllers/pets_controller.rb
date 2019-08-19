class PetsController < ApplicationController
  # before_action :require_login
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :find_pet, only: [:show, :edit, :update, :destroy]
  

  def index
    if params[:category].blank?
      
      @pets = Pet.all.order("created_at DESC")
    else
      @category_id = Category.find_by(name: params[:category]).id
      @pets =Pet.where(:category_id => @category_id).order("created_at DESC")
    end
    # @pets = Pet.search((params[:q].present? ? params[:q] : '*')).records
  end

  def new
    @pet = current_user.pets.build
    @categories =Category.all.map{ |e| [e.name, e.id]}
  end

  def edit
    @pet = Pet.find(params[:id])
    @categories =Category.all.map{ |e| [e.name, e.id]}
  end

  def show
    @pet= Pet.find(params[:id])
  end

  def create

    @pet = current_user.pets.build(pet_params)
    @pet.category_id = params[:category_id]

    @pet.user_id = current_user.id
    if(@pet.save)
      redirect_to pets_path(@pets)
    else
       @errors = @pet.errors.full_messages
      render 'new'
    end
  end

  def update
    @pet.category_id = params[:category_id]
    @pet.user_id = current_user.id
    if (@pet.update(pet_params))
    redirect_to pets_path(@pets)
    else
      @errors = @pet.errors.full_messages
      render 'edit'
    end
  end

  def destroy
    @pet.user_id = current_user.id
    @pet.destroy
    redirect_to pets_path(@pets)

  end

  private 
  def pet_params
    params.require(:pet).permit(:title, :description, :picture, :category_id, images:[])
  end

  def find_pet
    @pet = Pet.find(params[:id])
  end

end
