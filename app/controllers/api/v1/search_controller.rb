class Api::V1::SearchController < ApplicationController
  def index
    results = SearchFacade.new(params[:state], params[:search]).search_results
    render json: HouseMemberSerializer.new.serialize_json(results)
  end
  
  def show
    result = SearchFacade.new(params[:state], params[:search]).search_results
    render json: 
      SenateMemberSerializer.new.serialize_json(result)
  end
end