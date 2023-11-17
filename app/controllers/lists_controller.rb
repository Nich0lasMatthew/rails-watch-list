class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(lists_params)
    if @list.save
      redirect_to @list, notice: 'List was successfully created'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  # def set_list
  #   @list = List.new(params[:id])
  # end

  def lists_params
    params.require(:list).permit(:name)
  end
end
