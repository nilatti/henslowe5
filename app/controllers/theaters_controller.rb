class TheatersController < ApplicationController
  before_action :set_theater, only: [:show, :update, :destroy]
  before_action :authenticate_user!

  # GET /theaters
  def index
    @theaters = Theater.all

    render json: @theaters
  end

  # GET /theaters/1
  def show
    render json: @theater
  end

  # POST /theaters
  def create
    @theater = Theater.new(theater_params)

    if @theater.save
      render json: @theater, status: :created, location: @theater
    else
      render json: @theater.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /theaters/1
  def update
    if @theater.update(theater_params)
      render json: @theater
    else
      render json: @theater.errors, status: :unprocessable_entity
    end
  end

  # DELETE /theaters/1
  def destroy
    @theater.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_theater
      @theater = Theater.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def theater_params
      params.require(:theater).permit(:name)
    end
end
