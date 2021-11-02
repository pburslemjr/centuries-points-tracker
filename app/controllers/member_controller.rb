class MemberController < ApplicationController
  def index
    if params[:reverse] == "true"
      @reverse = true
    elsif params[:reverse] == false
      @reverse = false
    else
      @reverse = false
    end
    
    if params[:sort].nil?
      resetSorting
      
    end
    if params[:sort] == "pp"
      if !@reverse
        
        @members = Member.all.sort_by{|member| member.getPP}.reverse!
      else 
        @members = Member.all.sort_by{|member| member.getPP}
      end
    elsif params[:sort] == "mm"
      if !@reverse
        @members = Member.all.sort_by{|member| member.getMM}.reverse!
      else 
        @members = Member.all.sort_by{|member| member.getMM}
      end
    elsif params[:sort] == "hours"
      if !@reverse
        @members = Member.all.sort_by{|member| member.getService}.reverse!
      else 
        @members = Member.all.sort_by{|member| member.getService}
      end
    else
      if @reverse
        @members = Member.all.order(params[:sort]).reverse
      else 
        @members = Member.all.order(params[:sort])
      end
      
    end
    ordered = Event.order(:datetime)
   
    @past_events = ordered.where('datetime <= ?', Time.now)
    
  end

  def resetSorting
    @name_order = "asc"
    @email_order = ""
    @pp_order = ""
    @mm_order = ""
    @service_order = ""
  end

  def getSortArrow    
    if params[:reverse] == "true"      
      return '#8681;'
    else params[:reverse] == "false"      
      return '#8679;'
    
    end
  end

  helper_method :getSortArrow
  
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
