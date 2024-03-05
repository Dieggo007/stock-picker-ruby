
def stock_picker(stock_prices)
  stock_prices = stock_prices.map.with_index { |price, day| [price, day]}.sort_by { |price| price[0]}
  i = 0
  while i < stock_prices.length / 2
    return [stock_prices[i][1], stock_prices[-1 - i][1]] if stock_prices[i][1] < stock_prices[-1 - i][1]
    if stock_prices[-1 - i][0] - stock_prices[i + 1][0] > stock_prices[-2 - i][0] - stock_prices[i][0]
      return [stock_prices[i + 1][1], stock_prices[-1 - i][1]] if stock_prices[i + 1][1] < stock_prices[-1 - i][1]
    end
    return [stock_prices[i][1], stock_prices[-2 - i][1]] if stock_prices[i][1] < stock_prices[-2 - i][1]
    i += 1
  end
end

p stock_picker([17,3,6,9,15,8,6,1,10])