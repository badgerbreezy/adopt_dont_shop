class PetsController < ApplicationController
  def index
    @pets = Pet.all
  end

  def show
    
    @pet = Pet.find(params[:id])
  end

  def shelter_show
    @pets_per_shelter = Pet.where(shelter_id: params[:id])

  end
end
