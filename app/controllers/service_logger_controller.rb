class ServiceLoggerController < ApplicationController

  def index
    @service_loggers = ServiceLogHour.all
  end

  def show
    @service_logger = ServiceLogHour.find(params[:id])
  end

  def new
    @service_logger = ServiceLogHour.new
  end

  def create
    @service_logger = ServiceLogHour.new(service_logger_params)
    if @service_logger.save
       redirect_to service_logger_index_path, :notice => "Your hours have been sent for approval. Thank you for submitting your hours."
    else
      render('new')
    end
  end
  

  private
    def service_logger_params
      params.require(:service_logger).permit(:hours, :date, :activity, :description_service)
    end
end
