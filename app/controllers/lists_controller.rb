class ListsController < ApplicationController
  before_filter :load_list, :only => [:show, :destroy]

  def index
    @lists = List.all
    render json: @lists, each_serializer: ListPreviewSerializer
  end

  def show
    render json: @list, include: '**'
  end

  def create
    factory = ListFactory.new(list_params)
    @list = factory.create
    if @list.valid?
      render json: @list, include: '**'
    else
      render json: @list,
        status: :unprocessable_entity,
        serializer: ActiveModel::Serializer::ErrorSerializer
    end
  end

  # def update
  #   @list.update_attributes(list_params)
  #   redirect_to lists_url
  # end

  def destroy
    @list.destroy
    head :no_content
  end

  private
  def load_list
    @list = List.find(params[:id])
  end

  def list_params
    ActiveModelSerializers::Deserialization.jsonapi_parse(params.permit!)
  end
end
