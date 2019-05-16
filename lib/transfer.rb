require "pry"
require 'bank_account.rb'

class Transfer
  attr_reader :sender, :receiver, :amount
  attr_accessor :status

  def initialize (sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    @sender.valid? && @receiver.valid? && amount <= @sender.balance
    
  end

  def execute_transaction
    # binding.pry q
    if self.valid? && @status == "pending"
      # binding.pry
      @receiver.balance += @amount
      @sender.balance -= @amount
      @status = "complete"
      
    else
      @receiver.balance
      @sender.balance
      @status = "rejected"
      "Transaction rejected. Please check your account balance." 
    end
  end

  def reverse_transfer
    if @status == "complete"
      @receiver.balance -= @amount
      @sender.balance += @amount
      @status = "reversed"
    end
  end
 
end
