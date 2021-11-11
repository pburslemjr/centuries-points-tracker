class MemberController < ApplicationController
  def index
    @reverse = case params[:reverse]
               when 'true'
                 true
               else
                 false
               end

    reset_sorting if params[:sort].nil?
    @members = if params[:sort] == 'pp'
                 if @reverse
                   Member.all.sort_by(&:sort_pp)
                 else

                   Member.all.sort_by(&:sort_pp).reverse!
                 end
               elsif params[:sort] == 'mm'
                 if @reverse
                   Member.all.sort_by(&:sort_mm)
                 else
                   Member.all.sort_by(&:sort_mm).reverse!
                 end
               elsif params[:sort] == 'hours'
                 if @reverse
                   Member.all.sort_by(&:sort_service)
                 else
                   Member.all.sort_by(&:sort_service).reverse!
                 end
               elsif @reverse
                 Member.all.order(params[:sort]).reverse
               else
                 Member.all.order(params[:sort])

               end
    ordered = Event.order(:datetime)

    @past_events = ordered.where('datetime <= ?', Time.zone.now)
  end

  def reset_sorting
    @name_order = 'asc'
    @email_order = ''
    @pp_order = ''
    @mm_order = ''
    @service_order = ''
  end

  def sort_arrow
    if params[:reverse] == 'true'
      '#8681;'
    else
      '#8679;'
    end
  end

  helper_method :sort_arrow

  def show
    @member = Member.find_by(id: params[:id])

    if @member.nil?
      flash[:not_found] = params[:id]
      redirect_to(root_path)
    end
    @total_service_hours = Service.where(member_id: @member.id).sum(:hours)
    ordered = Event.order(:datetime)

    @past_events = ordered.where('datetime <= ?', Time.zone.now)
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

  def update; end

  def destroy; end
end
