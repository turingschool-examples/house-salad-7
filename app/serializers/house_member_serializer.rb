class HouseMemberSerializer
  def serialize_json(members)
    members.map do |member|
      require 'pry'; binding.pry
      {
        "data": [
          {
            "id": "nil",
            "type": "member",
            "attributes": {
              "name": "#{member.name}",
              "role": "#{member.role}",
              "party": "#{member.party}",
              "district": "#{member.district}"
            }
          }
        ]
      }
    end
  end
end