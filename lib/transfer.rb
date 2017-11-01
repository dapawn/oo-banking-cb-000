class Transfer
  def initialize(sender, reciever, amount)
    @sender = sender
    @reciever = reciever
    @status = "pending"
    @amount = amount
  end

  attr_accessor :sender, :reciever, :status, :amount

  def valid?
    @sender.valid? && @reciever.valid?
  end

  def execute_transaction
    @sender.balance -= @amount && @reciever.balance += @amount if valid?
  end

  def reverse_transaction
    @reciever.balance -= @amount && @sender.balance += @amount if @status == "executed"
  end
end