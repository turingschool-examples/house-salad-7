class HouseMember < Member
  attr_reader :name, :party, :role, :district
  def initialize(attributes)
    @role       = attributes[:role]
    @district   = attributes[:district]
    super
  end
end