class StrikersController < ApplicationController
  before_action :set_striker, only: [:show, :destroy]

  def index
    @strikers = Striker.all
  end

  def show
  end

  def new
    @striker = Striker.new
  end

  def create
    @striker = Striker.new(striker_params)
    @striker.renter = current_user
    if @striker.save
      redirect_to striker_path(@striker), notice: 'striker was successfully created.'
    else
      render :new
    end
  end

  def my_strikers
    @striker = Striker.where(params[:renter_id])
  end

  def destroy
    @striker.destroy
    redirect_to strikers_path, notice: 'striker was successfully destroyed.'
  end

  private

  def set_striker
    @striker = Striker.find(params[:id])
  end

  def striker_params
    params.require(:striker).permit(:war_tag, :description, :price, photos: [])
  end
end
