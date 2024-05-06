class SearchController < ApplicationController
  def index
    @facade = SearchFacade.new(params[:state])
    # state = params[:state]

    # conn = Faraday.new(url: "https://api.congress.gov") do |faraday|
    #   faraday.headers["X-API-Key"] = Rails.application.credentials.congress[:key]
    # end

    # response = conn.get("/v3/member?limit=250")
    
    # json = JSON.parse(response.body, symbolize_names: true)
    # members = json[:members].map do |member_data|
    #   if member_data[:state] == state
    #     Member.new(member_data)
    #   end
    # end
    # @members_by_state = members.compact
  end
end