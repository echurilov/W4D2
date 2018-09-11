class CatsController < ApplicationController
  def index
    @cats = Cat.all
  end
  
  def show 
    @cat = Cat.find(params[:id])
  end
  
  def create
    @cat = Cat.new(cat_params)
    if @cat.save
      redirect_to @cat
    else
      render json: @cat.errors.full_messages, status: 422
    end
  end
  
  def new
    nil_params = {name: "", sex: "", color: "", birth_date: "", description: "",}
    @cat = Cat.new(nil_params)
  end
    
  def edit
    @cat = Cat.find(params[:id])
  end

  def update
    @cat = Cat.find(params[:id])
    if @cat.update(cat_params)
      redirect_to cat_url(@cat)
    else
      render :edit
    end
  end
    
  private
  
  def cat_params
    params.require(:cat).permit(:name, :sex, :color, :birth_date, :description)
  end
  
end