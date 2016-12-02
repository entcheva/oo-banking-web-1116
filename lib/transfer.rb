class Transfer

  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    if @sender.valid? == true && @receiver.valid? == true
      return true
    else
      return false
    end
  end

  def execute_transaction
    if status == "pending"
      sender.balance = sender.balance - amount #Amanda's new balance
      receiver.balance = receiver.balance + amount # Avi's new balance
      @status = "complete"
    else
      return "Transaction rejected. Please check your account balance."
    end
    if !sender.valid?
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status == "complete"
      sender.balance = sender.balance + amount #Amanda's original balance
      receiver.balance = receiver.balance - amount # Avi's original balance
      @status = "reversed"
    end
  end

end
