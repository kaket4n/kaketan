class Admin::PicksController < AdminController
  def index
    @picks = Pick.all
  end

  def show
    @pick = Pick.find(params[:id])
  end

  def new
    @pick = Pick.new
  end

  def create
    @pick = Pick.new(pick_params)

    if @pick.save
      redirect_to admin_pick_path(@pick)
    else
      render :new
    end
  end

  private

  def pick_params
    params.require(:pick).permit(:url, :memo, :title, :description, :img_url)
  end
end
