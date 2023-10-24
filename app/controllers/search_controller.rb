class SearchController < ApplicationController
  def index
    facade = SearchFacade.new(params[:state], params[:search])
    if params[:state] != nil
      @results = facade.house_members
    elsif params[:search] != nil
      @results = [facade.senate_member_by_last_name]
    else
      flash[:error] = "There was a problem with your search."
      redirect_to root_path
    end
  end
end