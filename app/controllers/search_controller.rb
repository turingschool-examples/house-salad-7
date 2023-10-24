class SearchController < ApplicationController
  def index
    facade = SearchFacade.new(params[:state], params[:search])
    @results = facade.search_results
    if @results.is_a?(ErrorMember)
      flash[:error] = "#{@results.error_message}"
      redirect_to root_path
    end
  end
end