class ServicesController < ApplicationController

    def index      
        @service_hours = Service.order(:date)
    end
  
    def show
      @service = Service.find_by_id(params[:id])
      if @service.nil?
        flash[:not_found] = "Not found"
        redirect_to(services_path)
      end
    end
  
    def new
      @service = Service.new
    end
  
    def create
  
      @service = Service.new(service_params)
      @service.member_id = Member.find_by(email_id: cookies[:current_member_id]).id
      if @service.save
        redirect_to(services_path)
      else
        render('new')
      end
    end
  
    def edit
      @service = Service.find_by_id(params[:id])
      if @service.nil?
        render('edit')
      end
    end
  
    def update
      @service = Service.find(params[:id])
      if @service.update(service_params)
        redirect_to(service_path(@service))
      else
        flash[:errors] = @service.errors.full_messages
        redirect_to edit_service_path
      end
    end
  
    def delete
      @service = Service.find(params[:id])
    end
  
    def destroy
      @service = Service.find(params[:id])
      @service.destroy
      redirect_to(services_path)
    end
  
    private
      def service_params
        params.require(:service).permit(:hours, :date, :description)
      end
  
  
  end
  