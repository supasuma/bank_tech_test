#Understands all transactions and keeps as log
require_relative 'transaction'

class AccountSummary

  attr_reader :transaction_log

  def initialize
    @transaction_log = []
  end

  def deposit(amount, balance, time = Time.now.strftime("%d/%m/%Y"))
    deposit = Transaction.new(credit: amount, balance: balance, time: time)
    transaction_log << deposit
  end

  def withdrawal(amount, balance, time = Time.now.strftime("%d/%m/%Y"))
    withdrawal = Transaction.new(debit: amount, balance: balance, time: time)
    transaction_log << withdrawal
  end
  #

end
