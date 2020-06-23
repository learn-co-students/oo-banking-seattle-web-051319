require 'pry'
class Transfer
  # your code here
  attr_reader :sender, :amount, :receiver, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    if  @sender.valid? == true && @receiver.valid? == true && @amount <= @sender.balance
      true
    else
      false
    end
  end

  def execute_transaction
    #binding.pry
    if self.valid? == true && @status == "pending"
      @status = "complete"
      @sender.balance -= @amount
      @receiver.balance += @amount
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    #binding.pry
    if @status == "complete"
      @sender.balance += @amount
      @receiver.balance -= @amount
      @status = "reversed"
    end
  end

end
