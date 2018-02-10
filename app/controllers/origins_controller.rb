class OriginsController < ApplicationController
  before_action :authenticate_user!

  def index
    @origins = Origin.all
  end

  def show
    @origin = Origin.find(params[:id])
  end

  def new
  end

  def create
    @origin = Origin.new(origin_params)
    @origin.save
    redirect_to @origin
  end

  private
    def origin_params
      params.require(:origin).permit(:name, :region, :country, :processing_type, :elevation)
    end

end
