class MemberController < ApplicationController
  def index
    @members = Member.all.order('name desc')
    ordered = Event.order(:datetime)
   
    @past_events = ordered.where('datetime <= ?', Time.now)
    
  end
  
  def show
    @member = Member.find_by(id: params[:id])

    if @member.nil?
      flash[:not_found] = params[:id]
      redirect_to(root_path)
    end
    @total_service_hours = Service.where(member_id: @member.id).sum(:hours)
    ordered = Event.order(:datetime)
    
    @past_events = ordered.where('datetime <= ?', Time.now)
    

  end

  
  def edit
    @member = Member.find(params[:id])
    if @member.isAdmin
      @member.update(isAdmin: false)
    else
      @member.update(isAdmin: true)
    end
    redirect_to(member_path)
  end

  def update
  end

  def destroy
  end
end
