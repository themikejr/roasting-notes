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
    if params[:profile_id]
      @profile = Profile.find(params[:profile_id])
      @tasting = @profile.tastings.build(tasting_params)
      @tasting["user_id"] = current_user["id"]
      @tasting.save
      redirect_to profile_path(@profile)
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
      params.require(:tasting).permit(:user_id, :origin_id, :profile_id, :nose_notes, :mouth_notes)
    end
end
