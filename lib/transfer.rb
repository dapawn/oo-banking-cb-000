require "pry"
class Transfer
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  attr_accessor :sender, :receiver, :status, :amount

  def valid?
    @sender.valid? && @receiver.valid?
  end

  def execute_transaction
    if valid? && @status == "pending"
      ((@sender.balance -= @amount) && (@receiver.balance += @amount))
      @status = "executed"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    ((@receiver.balance -= @amount) && (@sender.balance += @amount)) if @status == "executed"
    @status = "reversed"
  end
end
