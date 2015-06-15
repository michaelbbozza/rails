class DogsController < ApplicationController
    skip_before_action :verify_authenticity_token
  def index
    @dogs = Dog.all.order("id")
  end

  def create
    Dog.create(doggy_params)
    redirect_to dogs_path
  end

  def new
    @dog = Dog.new
  end

  def edit
    @dog = Dog.find_by(id: params[:id])
  end

  def show
    @dog = Dog.find_by(id: params[:id])
  end

  def update
    Dog.find_by(id: params[:id]).update(doggy_params)
    redirect_to dogs_path
  end

  def destroy
    Dog.find_by(id: params[:id]).destroy
    redirect_to dogs_path
  end

private
def doggy_params
    params.require(:dog).permit( :name, :breed)
  end
end
