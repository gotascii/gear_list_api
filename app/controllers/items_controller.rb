class ItemsController < ApplicationController
  # before_action :load_item, only: [:destroy, :update]

  def index
    @items = Item.includes(:function).order("functions.name ASC, items.name ASC").limit(params[:limit]).offset(params[:offset])
    render json: @items, include: :function
  end

  def create
    @item = Item.create(item_params)
    if @item.valid?
      render json: @item
    else
      render json: @item,
        status: :unprocessable_entity,
        serializer: ActiveModel::Serializer::ErrorSerializer
    end
  end

  # def update
  #   @item.update_attributes(params[:item])
  #   render json: @item
  # end

  def destroy
    @item = Item.find(params[:id])
    @item.delete
    render json: @item
  end

  private
  def item_params
    ActiveModelSerializers::Deserialization.jsonapi_parse(params.permit!)
  end
end
