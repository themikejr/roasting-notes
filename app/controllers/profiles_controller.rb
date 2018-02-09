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

    @profile.save
    redirect_to @profile
  end

  private
    def profile_params
      params.require(:profile).permit(:coffee_name, :origin_country, :artisan_json)
    end

    def seconds_to_time(seconds)
      puts "about to convert"
      [seconds / 60 % 60, seconds % 60].map { |t| t.to_s.rjust(2,'0') }.join(':')
    end

end
