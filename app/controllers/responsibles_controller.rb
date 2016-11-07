class ResponsiblesController < ApplicationController
    
  before_action :authenticate_editor! , only:[:index,:edit,:new,:create,:update]
  before_action :authenticate_admin!, only:[ :new,:edit,:create,:update,:destroy]
  before_action :set_responsible, only: [:show, :edit, :update, :destroy]
  
  before_action :set_proyect , only: [:new,:edit]
 
  def index
    @responsibles = Responsible.paginate(page: params[:page],per_page:5)
  end

  
  def show
  end

 
  def new
    @responsible = Responsible.new
  end

 
  def edit
   
  end
  
  def create
    @responsible = Responsible.new(responsible_params)
    @responsible.assignproyect = params[:proyects]
    #raise params.to_yaml
    respond_to do |format|
      if @responsible.save
        format.html { redirect_to @responsible, notice: 'Responsible was successfully created.' }
        format.json { render :show, status: :created, location: @responsible }
      else
        format.html { render :new }
        format.json { render json: @responsible.errors, status: :unprocessable_entity }
      end
    end
  end

  def update

    @responsible.assignproyect = params[:proyects]
    respond_to do |format|
    
      if @responsible.update(responsible_params)
        format.html { redirect_to @responsible, notice: 'Responsible was successfully updated.' }
        format.json { render :show, status: :ok, location: @responsible }
      else
        format.html { render :edit }
        format.json { render json: @responsible.errors, status: :unprocessable_entity }
      end
    end
  end
 
  def destroy
    @responsible.destroy
    respond_to do |format|
      format.html { redirect_to responsibles_url, notice: 'Responsible was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
   
    def set_responsible
      @responsible = Responsible.find(params[:id])
    end

    def set_proyect
      @proyects = Proyect.all
    end

   
    def responsible_params
      params.require(:responsible).permit(:first_name, :last_name, :email, :address, :photo,:proyects)
    end
end
