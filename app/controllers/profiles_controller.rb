require 'json'

class ProfilesController < ApplicationController
  before_action :authenticate_user!

  def index
    @profiles = Profile.all
  end

  def show
    @profile = Profile.find(params[:id])
  end

  def new
  end

  def create
    @profile = Profile.new(profile_params)
    json_object = JSON.parse(@profile.artisan_json)
    @profile["roast_length"] = json_object["computed"]["totaltime"]
    @profile["roast_length_pretty"] = seconds_to_time(@profile["roast_length"])
    @profile["dry_time"] = json_object["computed"]["DRY_time"]
    @profile["dry_time_percentage"] = percentage(@profile["dry_time"], @profile["roast_length"])

    @profile["malliard_time"] = json_object["computed"]["midphasetime"]
    @profile["malliard_time_percentage"] = percentage(@profile["malliard_time"], @profile["roast_length"])

    @profile["development_time"] = json_object["computed"]["finishphasetime"]
    @profile["development_time_percentage"] = percentage(@profile["development_time"], @profile["roast_length"])

    @profile["charge_temp"] = json_object["computed"]["CHARGE_BT"]
    @profile["drop_temp"] = json_object["computed"]["DROP_BT"]

    @profile.save
    redirect_to @profile
  end

  private
    def profile_params
      params.require(:profile).permit(:origin_id, :batch_number, :artisan_json)
    end

    def seconds_to_time(seconds)
      [seconds / 60 % 60, seconds % 60].map { |t| t.to_s.rjust(2,'0') }.join(':')
    end

    def percentage(part, whole)
      part / whole
    end


end
