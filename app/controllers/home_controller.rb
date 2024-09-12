class HomeController < ApplicationController
  def index
    @homes = Home.all
    render :index
  end

  def create
    @home = Home.create(
      description: params[:description],
      year_built: params[year_built],
      square_feet: params[square_feet],
      bedrooms: params[bedrooms],
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
      year_built: params[year_built] || @homes.year_built,
      square_feet: params[square_feet] || @homes.square_feet,
      bedrooms: params[bedrooms] || @homes.bedrooms,
      floors: params[floors] || @homes.floors,
      availability: params[availability] || @homes.availability,
      address: params[address] || @homes.address,
      price: params[price] || @homes.price,
    )
    render :show
  end

  def destroy
    @home = Home.find_by(id: params[:id])
    @home.destroy
    render json: { message: "Home lisiting removed successfully" }
  end
end
