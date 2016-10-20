

require 'account_summary'

describe AccountSummary do
  subject(:account_summary) { described_class.new }
  let (:Transaction) { double(:Transaction) }
  let (:transaction) { double(:transaction)}

  before(:each) do
    allow(Transaction).to receive(:new) { transaction }
    @time_now = Time.now
    allow(Time).to receive(:now).and_return(@time_now)
    account_summary.deposit(@time_now, 100, 0)
  end

  describe '#deposit' do

    it 'should create a deposit' do
      expect(Transaction).to have_received(:new).with(time:@time_now, credit: 100, balance: 0)
    end

    it 'stores a deposit in the log' do
      expect(account_summary.transaction_log).to include(transaction)
    end
  end

  describe '#withdrawal' do
    before do
      account_summary.withdrawal(@time_now, 30, 70)
    end
    it 'should create a withdrawal' do
      expect(Transaction).to have_received(:new).with(time:@time_now, debit: 30, balance: 70)
    end

    it 'stores a withdrawal in the log' do
      expect(account_summary.transaction_log).to include(transaction)
    end
  end

end
