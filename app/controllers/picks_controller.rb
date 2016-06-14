class PicksController < ApplicationController
  def create
    @pick = Pick.create(pick_params)
    if @pick.valid?
      render json: @pick, include: '**'
    else
      render json: @pick, status: 422, serializer: ActiveModel::Serializer::ErrorSerializer
    end
  end

  # def destroy
  #   @pick = Pick.find(params.require(:id).permit)
  #   @pick.delete
  #   redirect_to_list_url
  # end

  def pick_params
    ActiveModelSerializers::Deserialization.jsonapi_parse(params.permit!)
  end
end
