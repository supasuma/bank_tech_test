#understands balance by adding and substracting transactions
  require_relative 'transaction'

 class BankController

 attr_reader :balance

   def initialize (transation_class = Transaction)
     @transation_class = transation_class
     @current_transaction = nil
     @transactions = []
     @balance = 0
   end

   def add_deposit(amount)
     @balance += amount
     build_transaction(amount)
   end

   private

   def build_transaction(amount)
     @current_transaction = @transation_class.new(amount, @balance)
     @transactions << @current_transaction
   end


 end
