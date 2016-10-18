#understands balance by adding and substracting transactions
  require_relative 'account_summary'

 class BankController

 attr_reader :balance, :account_summary

   def initialize
     @account_summary = account_summary || AccountSummary.new
     @balance = 0
   end

   def add_deposit(amount)
     @balance += amount
     account_summary.deposit(amount, balance)
   end

  def deduct_withdrawl(amount)
    fail "You don't have sufficient funds" if sufficient_funds?(amount)
    @balance -= amount
    account_summary.withdrawal(amount, balance)
  end

   private

    def sufficient_funds?(amount)
      @balance < amount
    end



 end
