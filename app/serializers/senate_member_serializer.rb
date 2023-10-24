class SenateMemberSerializer
  def serialize_json(member)
    {
      "data": [
        {
          "id": "1",
          "type": "member",
          "attributes": {
            "name": "#{member.name}",
            "title": "#{member.title}",
            "party": "#{member.party}",
            "twitter": "#{member.twitter}"
          }
        }
      ]
    }
  end
end
