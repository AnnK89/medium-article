require_relative 'transaction'
require 'pry-byebug'
# This is how you define your own custom exception classes
class DepositError < StandardError
end

class BankAccount
  attr_reader :name, :balance

  MIN_DEPOSIT = 100

  def initialize(name, iban, initial_deposit, password)
    fail DepositError, "Insufficient deposit" unless initial_deposit > MIN_DEPOSIT

    @password     = password
    @transactions = []
    @balance      = 0
    @name         = name
    @iban         = iban

    add_transaction(initial_deposit)
  end

  def withdraw(amount)
    add_transaction(-amount)
    return "You've just withdrawn #{amount} euros."
  end

  def deposit(amount)
    add_transaction(amount)
    return "You've just deposited #{amount} euros."
  end

  def transactions_history(args = {})
    # TODO: Check if there is a password and if so if it is correct
    # TODO: return a string displaying the transactions, BUT NOT return the transaction array!
    if args[:password] == @password
      return @transactions.join(',')
    elsif args.empty?
      return "no password given"
    else
      return "wrong password"
    end
  end

  def iban
    iban = @iban.split('-')
    "#{iban.first}#{'*' * 14}#{iban.last}"
    # @iban.gsub(/-.*-/, '**************')
  end

  def to_s
    "Owner: #{name} - IBAN: #{iban} - Balance: #{balance} euros"
  end

  private

  def add_transaction(amount)
    @transactions << Transaction.new(amount)
    @balance += amount
  end
end
