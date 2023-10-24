class Api::V1::SearchController < ApplicationController
  def index
    results = SearchFacade.new(params[:state], params[:search]).search_results
    render json: HouseMemberSerializer.new.serialize_json(results)
  end
  
  def show
    result = SearchFacade.new(params[:state], params[:search]).search_results
    if result.class == SenateMember
      render json: 
        SenateMemberSerializer.new.serialize_json(result)
    else
      render json: ErrorMemberSerializer.new(result).serialized_json
    end
  end
end