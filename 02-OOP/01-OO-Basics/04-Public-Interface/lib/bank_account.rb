# This is how you define your own custom exception classes
class DepositError < StandardError
end

class BankAccount
  attr_reader :name, :balance

  # Contract for the BankAccount class
  # - you can access full owner's name and balance, but partial IBAN
  # - you cannot access full IBAN
  # - you can print partial account info
  # - you can print transactions only with a password
  # - you can withdraw or deposit money
  # - You can see the balance of the account (through the balance variable)

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
    @iban.gsub(/-.*-/, '**************')
  end

  def to_s
    "Owner: #{@name} - IBAN: #{iban} - Balance: #{@balance} euros"
  end

  private

  def add_transaction(amount)
    @transactions << amount
    @balance += amount
  end
end

bank = BankAccount.new("John Lennon", "FR14-2004-1010-0505-0001-3M02-606", 200, "yoko")

p bank.iban
