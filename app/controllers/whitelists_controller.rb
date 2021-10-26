class WhitelistsController < ApplicationController
  def index
    redirect_to root_path if current_member.isAdmin == false
    @users = Whitelist.all
  end

  def new
    redirect_to root_path if current_member.isAdmin == false
    @user = Whitelist.new
  end

  def create
    redirect_to root_path if current_member.isAdmin == false
    @user = Whitelist.new(whitelist_params)
    if @user.save
      redirect_to(events_path)
    else
      render('new')
    end
  end

  def edit
    redirect_to root_path if current_member.isAdmin == false
    @user = Whitelist.find_by(id: params[:id])
    render('edit') if @user.nil?
  end

  def update
    redirect_to root_path if current_member.isAdmin == false
    @user = Whitelist.find(params[:id])
    if @user.update(whitelist_params)
      redirect_to(event_path(@user))
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to edit_whitelist_path
    end
  end

  def delete
    redirect_to root_path if current_member.isAdmin == false
    @user = Whitelist.find(params[:id])
  end

  def destroy
    redirect_to root_path if current_member.isAdmin == false
    @user = Whitelist.find(params[:id])
    @user.destroy
    redirect_to(whitelists_path)
  end

  private

  def whitelist_params
    params.require(:user).permit(:email, :isAdmin)
  end
end
