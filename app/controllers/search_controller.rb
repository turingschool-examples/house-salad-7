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

  def search
    conn = Faraday.new(url: "https://api.congress.gov") do |faraday|
      faraday.headers["X-API-Key"] = Rails.application.credentials.congress[:key]
    end
    
    response = conn.get("/v3/member?limit=250")

    data = JSON.parse(response.body, symbolize_names: true)

    members = data[:members]
    found_senators = members.find_all do |member| 
      # if a member has served on the Senate, this will be represented by the last (or only) element
        # in the member[:terms][:item] array
      senator = (member[:terms][:item][-1][:chamber] == "Senate")

      # manipulate string to only look at last name
      last_name = member[:name].split(' ')[0].gsub(',', '')

      # keep if: the last name matches our query, and the member is a senator
      last_name == params[:search] && senator
    end
    
    @member = found_senators.first
    render "welcome/index"
  end
end