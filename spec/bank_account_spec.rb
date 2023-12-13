require 'spec_helper'
require_relative '../lib/bank_account'

RSpec.describe BankAccount do
  describe '#cash' do
    it 'adds the passed amount to total' do
      bank_account = BankAccount.new(100)
      bank_account.cash(1)
      expect(bank_account.total).to eq(101)
    end
  end
end
