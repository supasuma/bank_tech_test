#understands balance by adding and substracting transactions
  require_relative 'account_summary'

 class BankController

 attr_reader :balance, :account_summary
 # I don't understand how to get rid of public readers, particularly for testing whether balance has been altered?

 OPENING_BALANCE = 0

   def initialize
     @account_summary = account_summary || AccountSummary.new
    #  Is the above reducing dependency purely by allowing another object that responds to bank_controllers methods to be passed in?
     @balance = OPENING_BALANCE
   end

   def add_deposit(time = Time.now, amount)
     @balance += amount
     account_summary.deposit(time, amount, balance)
   end

  def deduct_withdrawal(time = Time.now, amount)
    fail "You don't have sufficient funds" if sufficient_funds?(amount)
    @balance -= amount
    account_summary.withdrawal(time, amount, balance)
  end

  def print_statement
    account_summary.print_statement
  end

   private

    def sufficient_funds?(amount)
      @balance < amount
    end



 end
