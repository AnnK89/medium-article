# Optional
class Transaction
  attr_reader :amount, :transaction_date
  def initialize(amount)
    # Initialize amount and date of transaction
    @amount = amount
    @transaction_date = Time.now.strftime("%d/%m/%Y %H:%M")
  end

  def to_s
    "#{amount}€ on #{transaction_date}"
  end
end
