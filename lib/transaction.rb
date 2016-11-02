#understands what a transaction is - deposit or withdrawal
class Transaction

attr_reader :time, :credit, :debit, :balance

  def initialize(args)
    @time = args[:time]
    @credit = args[:credit]
    @debit = args[:debit]
    @balance = args[:balance]
  end

end
# this class only has state, no behaviour. You could consider a #to_s method that returns the data as a string - that way you could get rid of the attr_readers.
