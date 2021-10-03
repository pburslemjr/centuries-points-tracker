class ServiceLoggerController < ApplicationController

  def index
    @service_loggers = ServiceHour.all
  end

  def show
    @service_logger = ServiceHour.find(params[:id])
  end

  def new
    @service_logger = ServiceHour.new
  end

  def create
    @service_logger = ServiceHour.new(service_logger_params)
    if @service_logger.save
       redirect_to service_logger_index_path, :notice => "Your hours have been sent for approval. Thank you for submitting your hours."
    else
      render('new')
    end
  end
  

  private
    def service_logger_params
      params.permit(:hours, :date, :servicehoursID, :servicehourlistID, :description, :isApproved)
    end
end
