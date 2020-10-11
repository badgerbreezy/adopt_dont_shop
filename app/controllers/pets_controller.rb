class PetsController < ApplicationController
  def index
    @pets = Pet.all
  end

  def show
    @pet = Pet.find(params[:id])
  end

  def shelter_pets_index
    @pets_per_shelter = Pet.where(shelter_id: params[:id])
    @shelter_id = params[:id]
  end

  def new
    @shelter_id = params[:id]
    @shelter = Shelter.find(params[:id])
    @shelter_name = @shelter.name
  end

  def create
    @shelter = Shelter.find(params[:id])
    pet = Pet.new({
      image: params[:pet][:image],
      name: params[:pet][:name],
      description: params[:pet][:description],
      age: params[:pet][:age],
      sex: params[:pet][:sex],
      shelter_name: params[:pet][:shelter_name],
      status: params[:pet][:status],
      shelter_id: params[:pet][:shelter_id]
      })
    pet.shelter_id = params[:id]
    pet.save!
    redirect_to "/shelters/#{@shelter.id}/pets"
  end

  def edit
    @pet = Pet.find(params[:id])
  end

  def update

    @pet = Pet.find(params[:id])
    @pet.update({
      image: params[:pet][:image],
      name: params[:pet][:name],
      description: params[:pet][:description],
      age: params[:pet][:age],
      sex: params[:pet][:sex],
      # shelter_name: params[:pet][:shelter_name],
      # status: params[:pet][:status],
      # shelter_id: params[:pet][:shelter_id]
      })
    @pet.save!
    redirect_to "/pets/#{@pet.id}"
  end

  def destroy
    Pet.destroy(params[:id])
    redirect_to '/pets'
  end
end
