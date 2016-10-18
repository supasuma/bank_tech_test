class Transaction

  def initialize(amount, balance)
    @amount = amount
    @balance = balance
    @time = Time.now.strftime("%d/%m/%Y")
  end

end
