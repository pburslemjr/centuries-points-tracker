class WhitelistsController < ApplicationController
  def index
    if current_member.isAdmin == false
      redirect_to root_path
    end
    @users = Whitelist.all
  end

  def new
    if current_member.isAdmin == false
      redirect_to root_path
    end
    @user = Whitelist.new
  end

  def create
    if current_member.isAdmin == false
      redirect_to root_path
    end
    @user = Whitelist.new(whitelist_params)
    if @user.save
      redirect_to(events_path)
    else
      render('new')
    end
  end

  def edit
    if current_member.isAdmin == false
      redirect_to root_path
    end
    @user = Whitelist.find_by_id(params[:id])
    render('edit') if @user.nil?
  end

  def update
    if current_member.isAdmin == false
      redirect_to root_path
    end
    @user = Whitelist.find(params[:id])
    if @user.update(whitelist_params)
      redirect_to(event_path(@user))
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to edit_whitelist_path
    end
  end

  def delete
    if current_member.isAdmin == false
      redirect_to root_path
    end
    @user = Whitelist.find(params[:id])
  end

  def destroy
    if current_member.isAdmin == false
      redirect_to root_path
    end
    @user = Whitelist.find(params[:id])
    @user.destroy
    redirect_to(whitelists_path)
  end

  private

  def whitelist_params
    params.require(:user).permit(:email, :isAdmin)
  end

end
  
