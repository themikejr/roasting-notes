class TastingsController < ApplicationController
  SCAA_FIELDS = [:dry_fragrance,
		 :wet_aroma,
		 :flavor,
		 :aftertaste,
		 :acidity,
		 :body,
		 :balance,
		 :sweetness,
		 :uniformity,
                 :cleanliness ]

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
      @tasting["total_score"] = calculate_total_score(@tasting)
      @tasting["user_id"] = current_user["id"]
      @tasting.save
      redirect_to tasting_path(@tasting)
    end
  end

  private
    def tasting_params
      params.require(:tasting).permit(:user_id,
				      :origin_id,
				      :batch_id,
				      :dry_fragrance,
				      :wet_aroma,
				      :flavor,
				      :aftertaste,
				      :acidity,
				      :body,
				      :balance,
				      :sweetness,
				      :uniformity,
				      :cleanliness,
				      :nose_notes,
				      :mouth_notes)
    end

    def calculate_total_score(tasting)
      total = 0
      SCAA_FIELDS.each do |field|
        total += tasting[field]
      end
      return total
    end
end
