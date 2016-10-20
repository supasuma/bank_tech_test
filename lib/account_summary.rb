#keep everything unexposed use objects

#Understands all transactions and keeps as log
require_relative 'transaction'

class AccountSummary

  attr_reader :transaction_log
  #need to get rid of public readers...how???

  def initialize
    @transaction_log = []
  end

#Is there a way to make these into an args hash????
  def deposit(time, amount, balance)
    deposit = Transaction.new(time: time, credit: amount, balance: balance)
    transaction_log << deposit
  end

  def withdrawal(time, amount, balance)
    withdrawal = Transaction.new(time: time, debit: amount, balance: balance)
    transaction_log << withdrawal
  end

  def print_statement
    header
    format_statement
  end

private

#I can't get this to work keeps telling my undefined method time.  Am I able to access attributes
#of my objects this way?
  def format_statement
    transaction_log.map do |transaction|
      date = transaction.time.strftime("%d/%m/%Y")
      puts "#{date} || #{transaction.credit} || #{transaction.debit} || #{transaction.balance}"
    end
  end

  def header
    puts "date       || credit || debit || balance"
  end


end
