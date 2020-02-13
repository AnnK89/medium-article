class Mother
  @subclass_array = []

  def self.inherited(subclass)
    @subclass_array << subclass
  end

  def self.phone_kids
    @subclass_array.each { |subclass| subclass.phone }
  end
end
