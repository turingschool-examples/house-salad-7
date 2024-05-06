class Member
  attr_reader :name,
              :party,
              :state
              
  def initialize(attributes)
    @name = attributes[:name]
    @party = attributes[:partyName]
    @state = attributes[:state]
  end
end