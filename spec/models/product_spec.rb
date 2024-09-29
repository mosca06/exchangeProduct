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
end