class FunctionsController < ApplicationController
  # before_filter :load_new_item, :only => [:show]
  # before_filter :load_functions, :only => [:index, :show]

  def index
    @functions = Function.all
    render json: @functions, scope: :hide_items
  end

  private
  def function_params
    ActiveModelSerializers::Deserialization.jsonapi_parse(params.permit!)
  end
end
