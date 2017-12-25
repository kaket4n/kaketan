class Admin::PicksController < AdminController
  def index
    @picks = Pick.order(id: :desc).page(params[:page]).per(10)
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
      client = ::Twitter::REST::Client.new do |config|
        config.consumer_key        = Settings.twitter.key
        config.consumer_secret     = Settings.twitter.secret
        config.access_token        = Settings.twitter.token
        config.access_token_secret = Settings.twitter.token_secret
      end

      tweet = "#{@pick.memo} / #{@pick.title}｜KAKETAN.COM #{pick_url(@pick)} #KAKETANCOM"
      client.update(tweet)

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
