class ItemsController < ApplicationController
  before_action :load_item, only: [:destroy, :update]

  def index
    @items = Item
    @items = @items.where(function_id: params[:function_id]) unless params[:function_id].blank?
    @items = @items.order_by_function_name

    # The :scope deal is a super hacky way to hide the items that come
    # back in the relationships part of each included function.
    # See app/serializers/function_serializer.rb :(
    render json: @items, include: :function, scope: :hide_items
  end

  def create
    @item = Item.create(item_params)
    if @item.valid?
      render json: @item
    else
      render json: @item,
        status: :unprocessable_entity,
        adapter: :json_api,
        serializer: ActiveModel::Serializer::ErrorSerializer
    end
  end

  # def update
  #   @item.update_attributes(params[:item])
  #   render json: @item
  # end

  # def destroy
  #   @item.delete
  #   render json: @item
  # end
  private
  def item_params
    ActiveModelSerializers::Deserialization.jsonapi_parse(params.permit!)
    # HashWithIndifferentAccess.new({
    #   data: {
    #     type: "items",
    #     attributes: {
    #       weight: "300"
    #     },
    #     relationships: {
    #       function: {
    #         data: { type: "functions", id: "63" }
    #       }
    #     }
    #   }
    # })
  end
end
