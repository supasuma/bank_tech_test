require 'bank_controller'

describe BankController do
  subject(:bank_controller) { described_class.new }
  let (:AccountSummary) { double(:AccountSummary) }
  let (:account_summary) { double(:account_summary, deposit: nil, withdrawal: nil)}
  let(:amount) { double(:amount) }
  let(:balance) { double(:balance) }

before(:each) do
  allow(AccountSummary).to receive(:new) { account_summary }
  @time_now = Time.now
  allow(Time).to receive(:now).and_return(@time_now)
end

context '#add_deposit' do
  it ' should update balance' do
    expect { bank_controller.add_deposit(100) }.to change{ bank_controller.balance }.by 100
  end

  it 'should create a new account summary' do
    bank_controller.add_deposit(100)
    expect(account_summary).to have_received(:deposit).with(100, 100, @time_now)
  end
end

context '#deduct_withdrawal' do

  before(:each) do
    bank_controller.add_deposit(100)
  end

  it ' should update balance' do
    expect { bank_controller.deduct_withdrawal(100) }.to change{ bank_controller.balance }.by -100
  end

  it 'should create a new account summary' do
    bank_controller.deduct_withdrawal(100)
    expect(account_summary).to have_received(:withdrawal).with(100, 0, @time_now)
  end

end

context 'Insufficient funds' do

  it "should return message insufficient funds if balance too low" do
    expect{ bank_controller.deduct_withdrawal(50) }.to raise_error "You don't have sufficient funds"
  end
end







end
