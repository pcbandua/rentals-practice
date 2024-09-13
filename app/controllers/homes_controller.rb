class HomesController < ApplicationController
  def index
    @homes = Home.all
    render :index
  end

  def create
    @home = Home.create(
      description: params[:description],
      year_built: params[:year_built],
      square_feet: params[:square_feet],
      bedrooms: params[:bedrooms],
      bathrooms: params[bathrooms],
      floors: params[floors],
      availability: params[availability],
      address: params[address],
      price: params[price],
    )
    render :show
  end

  def show
    @home = Home.find_by(id: params[:id])
    render :show
  end

  def update
    @home = Home.find_by(id: params[:id])
    @home.update(
      description: params[:description] || @homes.description,
      year_built: params[:year_built] || @homes.year_built,
      square_feet: params[:square_feet] || @homes.square_feet,
      bedrooms: params[:bedrooms] || @homes.bedrooms,
      bathrooms: params[bathrooms] || @homes.bathrooms,
      floors: params[floors] || @homes.floors,
      availability: params[availability] || @homes.availability,
      address: params[address] || @homes.address,
      price: params[price] || @homes.price,
    )
    render :show
  end

  def destroy
    @home = Homes.find_by(id: params[:id])
    @home.destroy
    render json: { message: "The listing was successfuly removed" }
  end
end
