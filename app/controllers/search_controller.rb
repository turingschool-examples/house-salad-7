class SearchController < ApplicationController
  def index
    state = params[:state]
    conn = Faraday.new(url: "https://api.congress.gov") do |faraday|
      faraday.headers["X-API-Key"] = Rails.application.credentials.congress[:key]
    end

    response = conn.get("/v3/member?limit=250")
    
    json = JSON.parse(response.body, symbolize_names: true)
    @members_by_state = []
    json[:members].each do |member_data|
      if member_data[:state] == state
        @members_by_state << member_data
      end
    end
  end
end