class ProyectFilesController < ApplicationController
  before_action :set_proyect_file, only: [:show, :edit, :update, :destroy]

 
  def index
    @proyect_files = ProyectFile.all
  end
 
  def show
  end

  def new
    @proyect_file = ProyectFile.new
  end

  def edit
  end

  def create
    @proyect_file = ProyectFile.new(proyect_file_params)

    respond_to do |format|
      if @proyect_file.save
        format.html { redirect_to @proyect_file, notice: 'Proyect file was successfully created.' }
        format.json { render :show, status: :created, location: @proyect_file }
      else
        format.html { render :new }
        format.json { render json: @proyect_file.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @proyect_file.update(proyect_file_params)
        format.html { redirect_to @proyect_file, notice: 'Proyect file was successfully updated.' }
        format.json { render :show, status: :ok, location: @proyect_file }
      else
        format.html { render :edit }
        format.json { render json: @proyect_file.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @proyect_file.destroy
    respond_to do |format|
      format.html { redirect_to proyect_files_url, notice: 'Proyect file was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_proyect_file
      @proyect_file = ProyectFile.find(params[:id])
    end

    def proyect_file_params
      params.require(:proyect_file).permit(:name, :url_img, :format_img, :proyect_id)
    end
end
