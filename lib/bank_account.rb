class BankAccount
  attr_reader :total

  def initialize(amount)
    @total = amount
  end

  def cash(amount)
    @total += amount
  end
end
 
