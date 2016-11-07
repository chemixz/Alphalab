class ProyectsController < ApplicationController
  protect_from_forgery
  skip_before_action :verify_authenticity_token, :authenticate,  if: :json_request? 

  # before_action :authenticate_user!, except: [:index,:show,:search] # callback antes de accion hacer helper de devise
  # before_action :authenticate_editor!, only: [:new,:create,:update, :edit]
  # before_action :authenticate_admin!, only: [:destroy,:publish]
  before_action :set_proyect, except: [:index,:new,:create,:search] #call back para no repetir codigo en comun

  def search  #busqueda viene objeto desde form de busqueda y se evian a los scopes

      if search_params[:field] == 'title' or search_params[:field]=='body'
        pts = Proyect.search_by_projects(search_params)
      end
      if search_params[:field] == 'category'
        pts = Proyect.search_by_categories(search_params)
      end
      if search_params[:field] == 'responsible'
          pts = Proyect.search_by_responsibles(search_params)
      end
      @proyects = pts.paginate(page: params[:page],per_page:5)
      render 'proyects/index'
  end

  def index

    @proyects = Proyect.paginate(page: params[:page],per_page:10).ultimos
  end


  def show
  end

  def new
    @proyect = Proyect.new
  end
 
  def edit
  end

  def create
    #Quitar los comentarios solo pruebo con angular
    # @proyect = current_user.proyects.new(proyect_params)
    @proyect = Proyect.new(proyect_params)
    # @proyect.categories = params[:proyect][:categories] # le envio el arreglo categories al modelo en el setter
    # @proyect.responsibles = params[:proyect][:responsibles]
   
    respond_to do |format|
      if @proyect.save
        format.html { redirect_to @proyect, notice: 'Proyect was successfully created.' }
        format.json { render :show, status: :created, location: @proyect }
      else
        format.html { render :new }
        format.json { render json: @proyect.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @proyect.categories = params[:proyect][:categories] # le envio el arreglo categories al modelo en el setter
    @proyect.responsibles = params[:proyect][:responsibles]
   # raise params.to_yaml
    respond_to do |format|
      if @proyect.update(proyect_params)
        format.html { redirect_to @proyect, notice: 'Proyect was successfully updated.' }
        format.json { render :show, status: :ok, location: @proyect }
      else
        format.html { render :edit }
        format.json { render json: @proyect.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @proyect.destroy
    respond_to do |format|
      format.html { redirect_to proyects_url, notice: 'Proyect was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def finish_it
    @proyect.finish_it!
    redirect_to @proyect
  end

  private
    def set_proyect
      @proyect = Proyect.find(params[:id])
    end

    def proyect_params
      params.require(:proyect).permit(:title, :body, :start_date, :finish_date, :responsibles, :categories, :cover ,:user_id ) #quita user_id
    end

    def find_all_responsibles
      @responsibles = Responsible.all
    end

    def search_params
      params.require(:searcher).permit(:textsearch,  :field )
    end
  
protected

    def json_request?
      request.format.json?
    end
end
