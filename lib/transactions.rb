peter = Account.create(balance: 100, number: "12345")
paul = Account.create(balance: 200, number: "54321")

Account.transaction do
  paul.deposit(10)
  peter.withdraw(10)
end

class Account < ActiveRecord::Base
  validates :balance, numericality: {greater_than_or_equal_to: 0}

  def withdraw(amount)
    adjust_balance_and_save!(-amount)
  end

  def deposit(amount)
    adjust_balance_and_save!(amount)
  end

  private
  def adjust_balance_and_save!(amount)
    self.balance += amount
    save!
  end
end