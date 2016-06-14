class FunctionsController < ApplicationController
  def index
    @functions = Function.all
    render json: @functions, each_serializer: FunctionPreviewSerializer
  end

  def show
    @function = Function.find(params[:id])
    render json: @function, include: '**'
  end

  private
  def function_params
    ActiveModelSerializers::Deserialization.jsonapi_parse(params.permit!)
  end
end
