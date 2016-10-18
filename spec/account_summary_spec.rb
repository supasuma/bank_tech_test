

require 'account_summary'

describe AccountSummary do
  subject(:account_summary) { described_class.new }
  let (:Transaction) { double(:Transaction) }
  let (:transaction) { double(:transaction)}



  describe '#deposit' do
    before do
      allow(Transaction).to receive(:new) { transaction }
      @time_now = Time.now
      allow(Time).to receive(:now).and_return(@time_now)
    end

    it 'should create a deposit' do
      account_summary.deposit(100, 0, @time_now)
      expect(Transaction).to have_received(:new).with(credit: 100, balance: 0, time:@time_now)
    end

    it 'stores a deposit in the log' do
      account_summary.deposit(100, 0, @time_now)
      expect(account_summary.transaction_log).to include(transaction)
    end
  end

end
