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
    @sender.balance -= @amount && @receiver.balance += @amount if valid? && @status == "pending"
    @status = "executed"
  end

  def reverse_transaction
    @receiver.balance -= @amount && @sender.balance += @amount if @status == "executed"
  end
end
