class CoinsController < ApplicationController
  before_action :set_coin, only: [:show, :update, :destroy]

  # GET /coins
  # GET /coins.json
  def index
    @coins = Coin.all
    render "index.json.jbuilder"
  end

  # GET /coins/1
  # GET /coins/1.json
  def show
    set_coin
    render "show.json.jbuilder"
  end

  # POST /coins
  # POST /coins.json
  def create
    @coin = Coin.new(coin_params)

    if @coin.save
      render :show, status: :created, location: @coin
    else
      render json: @coin.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /coins/1
  # PATCH/PUT /coins/1.json
  def update
    if @coin.update(coin_params)
      render :show, status: :ok, location: @coin
    else
      render json: @coin.errors, status: :unprocessable_entity
    end
  end

  # DELETE /coins/1
  # DELETE /coins/1.json
  def destroy
    @coin.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_coin
      @coin = Coin.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def coin_params
      params.require(:coin).permit(:value, :name)
    end
end
