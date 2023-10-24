class Member
  attr_reader :name,
              :party

  def initialize(attributes)
    @name       = full_name(attributes)
    @party      = attributes[:party]
  end

  def full_name(data)
    "#{data[:first_name]} #{data[:last_name]}"
  end
end