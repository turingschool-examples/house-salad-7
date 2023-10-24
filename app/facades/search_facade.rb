class SearchFacade
  def initialize(state = nil, last_name = nil)
    @state = state
    @last_name = last_name
  end

  def search_results
    if @last_name
      senate_member_by_last_name
    else
      house_members
    end
  end

  def all_senate_members
    json = CongressService.new.senate_members[:results][0][:members]
  end

  def senate_member_by_last_name
    if !members_by_last_name(@last_name).empty?
      match = members_by_last_name(@last_name).first
      SenateMember.new(match)
    else 
      ErrorMember.new("No members found with the last name: #{@last_name}", "NOT FOUND", 404)
    end
  end

  def members_by_last_name(last_name)
    all_senate_members.find_all do |member|
      member[:last_name] == last_name
    end
  end

  def house_members
    service = CongressService.new

    json = service.members_by_state(@state)

    @members = json[:results].map do |member_data|
      HouseMember.new(member_data)
    end
  end
end