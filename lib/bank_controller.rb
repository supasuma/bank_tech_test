#understands balance by adding and substracting transactions
  require_relative 'account_summary'

 class BankController

 attr_reader :balance, :account_summary
 # I don't understand how to get rid of public readers, particularly for testing whether balance has been altered?
 # You have already done a great job of encapulating this class - it doesn't need to reveal any of it's attr_readers. Just make them private and you are done.
 # To test the balance, add a deposit then make a withdrawal - test to see that you don't see an insufficient funds error. Test the account summary by injecting a double.

 OPENING_BALANCE = 0

   def initialize
     @account_summary = account_summary || AccountSummary.new
    #  Is the above reducing dependency purely by allowing another object that responds to bank_controllers methods to be passed in?
     #  it would, if you were doing `def initialize(account_summary: nil)` - that way you could inject a double instead.
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
