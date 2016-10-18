require 'bank_controller'

describe BankController do
  subject(:bank_controller) { described_class.new(transaction_class) }
  let (:transaction_class) { double(:transaction_class) }
  let (:transaction) { double(:transaction)}

context '#add_deposit' do
  before do
    bank_controller.add_deposit(100)
  end

  it ' should update balance' do
    expect(bank_controller.balance).to eq(100)
  end

  it 'should create a new transaction' do
    expect(bank_controller.instance_variable_get(:@current_transaction))
  end
end




end
