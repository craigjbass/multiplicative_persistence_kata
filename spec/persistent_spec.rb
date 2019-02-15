class MultiplicativePersistence
  def self.calculate_for(number)
    return 0 if single_digit?(number)

    1 + calculate_for(product_of_each_digit_of(number))
  end

  private

  def self.single_digit?(number)
    number.digits.length == 1
  end

  def self.product_of_each_digit_of(number)
    product_of(number.digits)
  end

  def self.product_of(digits)
    digits.reduce(&:*)
  end
end

describe MultiplicativePersistence do
  def multiplicative_persistence_of(num, is:)
    expect(described_class.calculate_for(num)).to eq(is)
  end

  it 'can calculate multiplicative persitence' do
    multiplicative_persistence_of 1, is: 0
    multiplicative_persistence_of 10, is: 1
    multiplicative_persistence_of 11, is: 1
    multiplicative_persistence_of 12, is: 1
    multiplicative_persistence_of 25, is: 2
    multiplicative_persistence_of 26, is: 2
    multiplicative_persistence_of 30, is: 1
    multiplicative_persistence_of 31, is: 1
    multiplicative_persistence_of 32, is: 1
    multiplicative_persistence_of 39, is: 3
    multiplicative_persistence_of 40, is: 1
    multiplicative_persistence_of 47, is: 3
    multiplicative_persistence_of 48, is: 2
    multiplicative_persistence_of 49, is: 3
    multiplicative_persistence_of 77, is: 4
    multiplicative_persistence_of 250, is: 1
    multiplicative_persistence_of 251, is: 2
    multiplicative_persistence_of 679, is: 5
    multiplicative_persistence_of 999, is: 4
    multiplicative_persistence_of 277777788888899, is: 11
  end
end
