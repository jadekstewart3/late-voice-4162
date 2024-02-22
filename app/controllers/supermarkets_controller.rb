class SupermarketsController < ApplicationController
  def show
    @market = Supermarket.find(params[:id])
    @market_customers = @market.supermarket_customers
  end
end