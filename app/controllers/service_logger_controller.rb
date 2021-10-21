class ServiceLoggerController < ApplicationController

  before_action :set_service_logger, only: [:show, :edit, :update, :destroy, :delete]

  def index
    @service_loggers = ServiceHour.all
  end

  def show
  end

  def new
    @service_logger = ServiceHour.new
  end

  def edit
  end

  def delete
  end

  def create
    @service_logger = ServiceHour.new(service_logger_params)
    if @service_logger.save
       redirect_to service_logger_index_path, :notice => "Your hours have been sent for approval. Thank you for submitting your hours."
    else
      render('new')
    end
  end

  def update
    if @service.update(service_logger_params)
      redirect_to service_logger_index_path, :notice => "Your updates have been sent for approval. Thank you for updating your hours."
    else
      render('edit')
    end
  end
  
  def destroy
    @service_logger.destroy
    redirect_to service_logger_index_path
  end

  private
    
  def set_service_logger
    @service_logger = ServiceHour.find(params[:id])
  end

  def service_logger_params
    params.permit(:hours, :date, :id, :description, :isApproved)
  end

end
