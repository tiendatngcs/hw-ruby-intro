# When done, submit this entire file to the autograder.

# Part 1

def sum arr
  # YOUR CODE HERE
  sum = 0
  arr.each {|element| sum += element}
  return sum
end

def max_2_sum arr
  # YOUR CODE HERE
  if arr.length == 0
    return 0
  end

  if arr.length == 1
    return arr[0]
  end

  first , second = arr[0], nil
  arr[1..arr.length-1].each do |element|
    if element >= first
      second = first
      first = element
    else
      if second == nil
        second = element
      end
    end
  end
  return first + second
end

def sum_to_n? arr, n
  # YOUR CODE HERE
  if arr.length < 2
    return false
  end
  complement = arr.map {|element| n-element}
  complement = complement.sort
  arr = arr.sort
  a, c = 0, 0
  if n % 2 == 0 && arr.include?(n/2)
    if arr.count(n/2) > 1
      return true
    else
      arr.delete(n/2)
    end
  end
  until a >= arr.length || c >= complement.length
    if arr[a] == complement[c]
      return true
    elsif arr[a] < complement[c]
      a += 1
    else
      c += 1
    end
  end
  return false
end

# Part 2

def hello(name)
  # YOUR CODE HERE
  return "Hello, " + name
end

def starts_with_consonant? s
  # YOUR CODE HERE
  if s.length == 0
    return false
  end
  start = s[0].downcase
  if "bcdfgjklmnpqstvxzhrwy".include?(start)
    return true
  end
  return false
end

def binary_multiple_of_4? s
  # YOUR CODE HERE
  if s == "0"
    return true
  end
  if s.length < 2
    return false
  end
  sa = s.split("")
  if sa.uniq.sort != ["0", "1"]
    return false
  end
  if sa[sa.length-1] == "0" && sa[sa.length-2] == "0"
    return true
  end
  return false
end

# Part 3

class BookInStock
# YOUR CODE HERE
  attr_accessor :isbn, :price
  def initialize(isbn, price)
    
    raise ArgumentError.new(
      "invalid argument to BookInStock"
    ) if isbn == "" || price <= 0

    @isbn = isbn
    @price = price
  end

  def isbn
    @isbn
  end
  
  def isbn=(isbn)
    @isbn = isbn
  end

  def price
    @price
  end
  
  def price=(price)
    @price = price
  end

  def price_as_string()
    return "$%0.2f" % [@price]
  end
end
