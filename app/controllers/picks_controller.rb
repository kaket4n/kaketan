class PicksController < ApplicationController
  before_action :set_pick, only: :show
  before_action :set_title, only: :show

  def index
    @picks = Pick.all
  end

  def show
  end

  private

  def set_pick
    @pick = Pick.find(params[:id])
  end

  def set_title
    if @pick&.url.present?
      @title = "#{@pick.url}｜KAKETAN.COM"
    end
  end
end
