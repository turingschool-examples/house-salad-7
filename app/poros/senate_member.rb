class SenateMember < Member
  attr_reader :name, :title, :first_name, :last_name, :twitter

  def initialize(attributes)
    @title         = attributes[:title]
    @first_name    = attributes[:first_name]
    @last_name     = attributes[:last_name]
    @twitter       = attributes[:twitter_account]
    super
  end
end