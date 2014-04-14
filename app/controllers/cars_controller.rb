class CarsController < ApplicationController

  def new
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)
    if @car.save
      redirect_to new_car_path,
      notice: "Car successfully submitted!"
    else
      render 'new'
    end
  end




  protected

  def car_params
    params.require(:car).permit(:mileage, :year, :color, :description)
  end

end
