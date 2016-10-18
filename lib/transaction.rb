class Transaction

  def initialize(amount, balance)
    @amount = amount
    @current_balance = balance
    @time = Time.now.strftime("%d/%m/%Y")
  end
  
end
