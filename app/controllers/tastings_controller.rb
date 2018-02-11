class TastingsController < ApplicationController
  def index
    @tastings = Tasting.all
  end

  def show
    @tasting = Tasting.find(params["id"])
  end

  def new
  end

  def create
    if params[:batch_id]
      @batch = Batch.find(params[:batch_id])
      @tasting = @batch.tastings.build(tasting_params)
      @tasting["user_id"] = current_user["id"]
      @tasting.save
      redirect_to batch_path(@batch)
    else
      puts tasting_params
      @tasting = Tasting.new(tasting_params)
      @tasting["user_id"] = current_user["id"]
      @tasting.save
      redirect_to tasting_path(@tasting)
    end
  end

  private
    def tasting_params
      params.require(:tasting).permit(:user_id, :origin_id, :batch_id, :nose_notes, :mouth_notes)
    end
end
