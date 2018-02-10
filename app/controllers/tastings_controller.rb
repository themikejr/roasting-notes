class TastingsController < ApplicationController
  def create
    @profile = Profile.find(params[:profile_id])

    @tasting = @profile.tastings.build(tasting_params)
    @tasting["user_id"] = current_user["id"]
    @tasting.save

    redirect_to profile_path(@profile)
  end

  private
    def tasting_params
      params.require(:tasting).permit(:user_id, :nose_notes, :mouth_notes)
    end
end
