# it 'should create a new transaction if sufficient funds' do
#   @time_now = Time.now
#   allow(Time).to receive(:now).and_return(@time_now)
#   expect(bank_controller.instance_variable_get(:@current_transaction)).to eq(transaction_withdrawl)
# end
#
#
# context '#print_transactions' do
#   before do
#     transactions.push(transaction_withdrawl, transaction_deposit)
#   end
#
#   it 'should print transactions' do
#     bank_controller.print_transactions
#
#   end
# end
