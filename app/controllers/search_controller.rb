class SearchController < ApplicationController
  def index
    facade = SearchFacade.new(params[:state], params[:search])
    @results = facade.search_results
  end
end