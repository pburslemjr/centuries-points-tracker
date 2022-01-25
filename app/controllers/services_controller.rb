class ServicesController < ApplicationController
  def index
    @service_hours = nil
    @greeting = 'Your Logged Service Hours'
    if current_member.isAdmin == true
      @service_hours = Service.all.order('date desc')
      @service_hours_approved = Service.where(isApproved: true).limit(20).order('date asc')
      @service_hours_unapproved = Service.where(isApproved: false).limit(20).order('date asc')
      @greeting = 'All Service Hours'
    else
      @service_hours = Service.where(member_id: current_member.id).limit(20).order('date desc')

    end
  end

  def show
    @service = Service.find_by(id: params[:id])

    if @service.nil?
      flash[:not_found] = 'Not found'
      redirect_to(services_path)
    end
  end

  def new
    @service = Service.new
  end

  def create
    @service = Service.new(service_params)
    @service.member_id =  current_member.id
    @service.isApproved = false
    if @service.save
      redirect_to(services_path)
    else
      render('new')
    end
  end

  def edit
    @service = Service.find_by(id: params[:id])
    render('edit') if @service.nil?
  end

  def update
    @service = Service.find(params[:id])
    if @service.update(service_params)
      redirect_to(service_path(@service))
    else
      flash[:danger] = @service.errors.full_messages
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

  def approve
    @service = Service.find(params[:id])
    @service.update(isApproved: true)
    redirect_to(services_path)
  end

  def unapprove
    @service = Service.find(params[:id])
    @service.update(isApproved: false)
    redirect_to(services_path)
  end

  private

  def service_params
    params.require(:service).permit(:hours, :date, :description)
  end
end
