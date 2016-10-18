#understands balance by adding and substracting transactions
  require_relative 'account_summary'

 class BankController

 attr_reader :balance, :account_summary

 OPENING_BALANCE = 0

   def initialize
     @account_summary = account_summary || AccountSummary.new
     @balance = OPENING_BALANCE
   end

   def add_deposit(amount)
     @balance += amount
     account_summary.deposit(amount, balance)
   end

  def deduct_withdrawal(amount)
    fail "You don't have sufficient funds" if sufficient_funds?(amount)
    @balance -= amount
    account_summary.withdrawal(amount, balance)
  end

  # def print_transactions
  #   account_summary.transaction_log.each do |transaction|
  #     transaction.map do |element|
  #       "date = element.time"
  # end

   private

    def sufficient_funds?(amount)
      @balance < amount
    end



 end
