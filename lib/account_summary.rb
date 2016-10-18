class AccountSummary

  def initialize
    @transaction_log = []
  end

  def deposit(amount, balance)
    deposit = Transaction.new(amount: amount, current_balance: balance)
    transaction_log << deposit
  end

  def withdrawal(amount, balance)
    withdrawal = Transaction.new(amount: amount, current_balance: balance)
    transaction_log << withdrawal
  end

  def print_transactions
    transaction_log.each do |transaction|
      transaction.map do |element|
        ""
  end
end
