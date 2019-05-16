require "pry"

class Transfer
  attr_reader :to
  attr_accessor :amount, :from, :status

def initialize(from, to, amount, status="pending")
  @from = from
  @to = to
  @amount = amount
  @status = status
end

def sender
  sender = self.from
end

def receiver
  receiver = self.to
  # binding.pry
end

# def status
#   # binding.pry
#   sender.status = "pending"
#   # binding.pry
# end

def valid?
  # binding.pry
  if @from.valid? && @to.valid? && @from.balance >= @amount
    true
  else
    false
    end
  end

  def execute_transaction
    # binding.pry
    if self.valid?
      @from.balance -= @amount
      @to.balance += @amount
      # binding.pry
      @from.status = "complete"
      @to.status = "complete"
      @status = "complete"
    else
      @from.status = "rejected"
      @to.status = "rejected"
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
      # binding.pry
    end
  end

  def reverse_transfer
    if @status == "complete"
    @from.balance += @amount
    @to.balance -= @amount
    @from.status = "reversed"
    @to.status = "reversed"
    @status = "reversed"
  end
# binding.pry
  end

  end
