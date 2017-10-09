class PicksController < ApplicationController
  before_action :set_pick, only: :show
  before_action :set_title

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
    case action_name
    when "index"
      @title = "Picks"
    when "show"
      @title = @pick&.title
    end
  end
end
