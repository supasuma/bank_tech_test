#understands balance by adding and substracting transactions
  require_relative 'transaction'

 class BankController

 attr_reader :balance
 # :transactions

# (transation_class = Transaction)
   def initialize
     @account_summary = account_summary || AccountSummary.new
     @current_transaction = nil
    #  @transactions = []
     @balance = 0
   end

   def add_deposit(amount)
     @balance += amount
     @account_summary.deposit(amount, @balance)
   end

  def deduct_withdrawl(amount)
    # fail "You don't have sufficient funds.  Current balance is #{@balance}" if sufficient_funds?(amount)
    @balance -= amount
    @account_summary.withdrawal(amount, @balance)
  end



   private




 end
