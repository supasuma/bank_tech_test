require 'bank_controller'

describe BankController do
  subject(:bank_controller) { described_class.new(transaction_class) }
  let (:transaction_class) { double(:transaction_class) }

context '#add_deposit' do
  it 'updates balance' do
    bank_controller.add_deposit(100)
    expect(bank_controller.balance).to eq(100)
  end
end




end
