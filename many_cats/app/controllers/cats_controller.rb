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
    
  def edit
    @cat = Cat.find(params[:id])
  end
    
  private
  
  def cat_params
    params.require(:cats).permit(:name, :sex, :color, :birth_date, :description)
  end
  
end