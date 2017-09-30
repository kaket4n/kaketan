class PicksController < ApplicationController
  def index
    @picks = Pick.all
  end

  def show
    @pick = Pick.find(params[:id])
  end
end
