require_relative '../lib/bank_account'

class Transfer
  # your code here
  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount, status = "pending")
    @sender = sender
    @receiver = receiver 
    @amount = amount 
    @status = status
  end

  def valid?
    if sender.valid? && receiver.valid? && sender.balance >= amount
      true
    else
      false
    end
  end

  def execute_transaction
    if self.valid?
        sender.balance -= amount
        receiver.balance += amount
        receiver.status = "complete"
        sender.status = "complete"
        self.status = "complete"
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end

  end

  def reverse_transfer
    if self.status == "complete"
      sender.balance += amount
      receiver.balance -= amount
      self.status = "reversed"
    end
  end



end
