class PlaywrightsController < ApplicationController
  before_action :set_playwright, only: [:show, :update, :destroy]
  before_action :authenticate_user!

  # GET /playwrights
  def index
    @playwrights = Playwright.all

    render json: @playwrights
  end

  # GET /playwrights/1
  def show
    render json: @playwright
  end

  # POST /playwrights
  def create
    @playwright = Playwright.new(playwright_params)

    if @playwright.save
      render json: @playwright, status: :created, location: @playwright
    else
      render json: @playwright.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /playwrights/1
  def update
    if @playwright.update(playwright_params)
      render json: @playwright
    else
      render json: @playwright.errors, status: :unprocessable_entity
    end
  end

  # DELETE /playwrights/1
  def destroy
    @playwright.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_playwright
      @playwright = Playwright.find(params[:id])
    end

    def plays
      @playwright.plays
    end
    # Only allow a trusted parameter "white list" through.
    def playwright_params
      params.require(:playwright).permit(:first_name, :last_name, :birth_date, :death_date, :country_of_origin, :bio)
    end
end
