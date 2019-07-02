class CatsController < ApplicationController

  def index
    @cats = Cat.all
    render :index
  end
  
  def show
    # debugger
    @cat = Cat.find(params[:id])
    render :show
  end

  def new
    # @cat =Cat.new()
    render :new
  end

  def create
    @cat = Cat.new(cat_params)
    debugger
    if @cat.save
      redirect_to cat_url(@cat)
    else
      @cat.errors.full_messages
    end
  end

  def edit
    # debugger
    @cat = Cat.find(params[:id])
    render :edit
  end


  def update
    kitten = Cat.find(params[:id])
    kitten.save
    redirect_to cat_url(kitten)
  end
  private

  def cat_params
    # debugger
    params.require(:cat).permit(:name, :sex, :birth_day, :description, :color)
  end
end