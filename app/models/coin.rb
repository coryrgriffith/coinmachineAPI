class Coin < ApplicationRecord
  def total_coin_value
    all_coins = Coin.all
    total_value = 0
    all_coins.each do |coin|
      total_value += coin.value
    end
    return total_value.to_f
  end
end
