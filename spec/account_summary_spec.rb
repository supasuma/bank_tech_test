

require 'account_summary'

describe AccountSummary do
  subject(:account_summary) { described_class.new }
  let (:Transaction) { double(:Transaction) }
  let (:transaction) { double(:transaction)}

  before(:each) do
    allow(Transaction).to receive(:new) { transaction }
    @time_now = Time.now
    allow(Time).to receive(:now).and_return(@time_now)
    account_summary.deposit(100, 0, @time_now)
  end

  describe '#deposit' do

    it 'should create a deposit' do
      expect(Transaction).to have_received(:new).with(credit: 100, balance: 0, time:@time_now)
    end

    it 'stores a deposit in the log' do
      expect(account_summary.transaction_log).to include(transaction)
    end
  end

  describe '#withdrawal' do
    before do
      account_summary.withdrawal(30, 70, @time_now)
    end
    it 'should create a withdrawal' do
      expect(Transaction).to have_received(:new).with(debit: 30, balance: 70, time:@time_now)
    end

    it 'stores a withdrawal in the log' do
      expect(account_summary.transaction_log).to include(transaction)
    end
  end

end
