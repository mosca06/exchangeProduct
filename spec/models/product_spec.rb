require "models/product"

RSpec.describe Product do
  context ".new" do
    it "returns product with filled attributes" do
      # Arrange
      params = {
        name: 'Funko',
        price: 50
      }
      # Act
      result = described_class.new(**params)
      # Assert
      expect(result.name).to eq(params[:name])
      expect(result.price).to eq(params[:price])
    end
  end

  context ".all" do
    it "return all products" do
      funko1 = Product.new(name: "Funko", price: 50)
      funko2 = Product.new(name: "Funko2", price: 500)
      funko3 = Product.new(name: "Funko3", price: 100)

      result = described_class.all

      expect(result).to include(funko1,funko2,funko3)
    end
  end

  context '#as_json' do
    it "return the object as json" do
      params = {name: "Funko", price: 50}
      funko1 = Product.new(**params)

      result = funko1.as_json

      expect(result).to eq(params)
    end
  end

  context '.search' do
    it "return the searched objects" do
      Product.reset_data_set  
      funko1 = Product.new(name: "Funko", price: 50)
      funko2 = Product.new(name: "Funko2", price: 500)
      funko3 = Product.new(name: "Funko3", price: 100)

      result1 = Product.search(5)
      result2 = Product.search('o')

      expect(result1).to eq([funko1,funko2])
      expect(result2).to eq([funko1,funko2,funko3])
    end
  end
end