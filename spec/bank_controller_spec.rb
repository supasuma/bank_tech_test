require 'bank_controller'

describe BankController do
  subject(:bank_controller) { described_class.new }
  let (:AccountSummary) { double(:AccountSummary, new: account_summary) }
  let (:account_summary) { double(:account_summary, deposit: nil)}
  let(:amount) { double(:amount) }
  let(:balance) { double(:balance) }



context '#add_deposit' do
  before do
    bank_controller.add_deposit(100)
  end

  it ' should update balance' do
    expect(bank_controller.balance).to eq(100)
  end

  it 'should create a new account_summary' do
    expect(account_summary).to have_received(:deposit).with(amount, balance)
  end
end


context '#deduct_withdrawl' do
  before do
    bank_controller.add_deposit(100)
    bank_controller.deduct_withdrawl(50)
  end

  it 'should update balance if sufficient funds' do
    expect(bank_controller.balance).to eq(50)
  end

  it 'should create a new account_summary' do
    expect(account_summary).to have_received(:deposit).with(amount, balance)
  end

end

context 'Insufficient funds' do
  it "should return message insufficient funds if balance too low" do
    expect{ bank_controller.deduct_withdrawl(50) }.to raise_error "You don't have sufficient funds"
  end
end







end
