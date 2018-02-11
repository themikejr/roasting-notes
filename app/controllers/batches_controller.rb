require 'json'

class BatchesController < ApplicationController
  before_action :authenticate_user!

  def index
    @batches = Batch.all
  end

  def show
    @batch = Batch.find(params[:id])
  end

  def new
  end

  def create
    @batch = Batch.new(batch_params)
    json_object = JSON.parse(@batch.artisan_json)
    @batch["roast_length"] = json_object["computed"]["totaltime"]
    @batch["roast_length_pretty"] = seconds_to_time(@batch["roast_length"])
    @batch["dry_time"] = json_object["computed"]["DRY_time"]
    @batch["dry_time_percentage"] = percentage(@batch["dry_time"], @batch["roast_length"])

    @batch["malliard_time"] = json_object["computed"]["midphasetime"]
    @batch["malliard_time_percentage"] = percentage(@batch["malliard_time"], @batch["roast_length"])

    @batch["development_time"] = json_object["computed"]["finishphasetime"]
    @batch["development_time_percentage"] = percentage(@batch["development_time"], @batch["roast_length"])

    @batch["charge_temp"] = json_object["computed"]["CHARGE_BT"]
    @batch["drop_temp"] = json_object["computed"]["DROP_BT"]
    @batch["roast_date"] = DateTime.strptime(json_object["roastdate"],"%a %b %d %Y")

    @batch.save
    redirect_to @batch
  end

  private
    def batch_params
	    params.require(:batch).permit(:origin_id, :batch_number, :start_weight, :end_weight, :roast_date, :artisan_json)
    end

    def seconds_to_time(seconds)
      [seconds / 60 % 60, seconds % 60].map { |t| t.to_s.rjust(2,'0') }.join(':')
    end

    def percentage(part, whole)
      part / whole
    end


end
