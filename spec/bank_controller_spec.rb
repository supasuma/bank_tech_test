require 'bank_controller'

describe BankController do
  subject(:bank_controller) { described_class.new }
  let (:AccountSummary) { double(:AccountSummary) }
  let (:account_summary) { double(:account_summary)}
  # let(:amount) { double(:amount) }
  # let(:balance) { double(:balance) }


context '#add_deposit' do
  before do
    allow(AccountSummary).to receive(:new) { account_summary }
    allow(account_summary).to receive(:deposit)
  end

  it ' should update balance' do
    expect { bank_controller.add_deposit(100) }.to change{ bank_controller.balance }.by 100
  end
end

context '#deduct_withdrawal' do
  before do
      allow(AccountSummary).to receive(:new) { account_summary }
      allow(account_summary).to receive(:withdrawal)
      allow(account_summary).to receive(:deposit)
  end

  it ' should update balance' do
    bank_controller.add_deposit(100)
    expect { bank_controller.deduct_withdrawal(100) }.to change{ bank_controller.balance }.by -100
  end

end

context 'Insufficient funds' do

  before do
      allow(AccountSummary).to receive(:new) { account_summary }
      allow(account_summary).to receive(:withdrawal)
  end

  it "should return message insufficient funds if balance too low" do
    expect{ bank_controller.deduct_withdrawal(50) }.to raise_error "You don't have sufficient funds"
  end
end







end
