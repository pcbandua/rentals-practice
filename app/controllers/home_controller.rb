class HomeController < ApplicationController
  def index
    @homes = Home.all
    render :index
  end

  def create
    @home = Home.create(
      description: params[:description],
      year_built: params[year_built],
      square_feet: params[year_built],
      bedrooms: params[bedrooms],
      floors: params[floors],
      availability: params[availability],
      address: params[address],
      price: params[price],
    )
    render :show
  end
end
