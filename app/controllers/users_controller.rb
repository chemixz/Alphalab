class UsersController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_user, only: [:show,:edit,:update,:destroy]
  def index
  	@users = User.all
  end
   
  def show
  end

  def edit
  end

  def update
 
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @proyect }
      else
        format.html { render :edit }
        format.json { render json: @proyect.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
 
    @user.destroy
    respond_to do |format|
      format.html { redirect_to @user, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

   private

	def user_params
      params.require(:user).permit(:email, :permission_level ,:nickname)
    end

    def set_user
    	@user = User.find(params[:id])
    end


end