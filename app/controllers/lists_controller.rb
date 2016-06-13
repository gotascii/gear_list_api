class ListsController < ApplicationController
  # before_filter :load_list, :only => [:show, :edit, :update, :destroy]
  # before_filter :load_lists, :only => [:index, :edit]

  def index
    @lists = List.all
    render json: @lists
  end

  # def show
  #   @items = Item.order_by_function_name
  #   @picks = @list.picks.order_by_item_function_name
  #   @pick = Pick.new(:list => @list)
  # end

  def create
    factory = ListFactory.new(list_params)
    @list = factory.create
    if @list.valid?
      render json: @list
    else
      render json: @list, status: 422, serializer: ActiveModel::Serializer::ErrorSerializer
    end
  end

  # def edit
  # end

  # def update
  #   @list.update_attributes(list_params)
  #   redirect_to lists_url
  # end

  def destroy
    @list = List.find(params[:id])
    @list.destroy
    head :no_content
  end

  private
  # def load_list
  #   @list = List.find(params[:id])
  # end

  # def load_lists
  #   @lists = List.order_by_name
  # end

  def list_params
    ActiveModelSerializers::Deserialization.jsonapi_parse(params.permit!)
  end
end
