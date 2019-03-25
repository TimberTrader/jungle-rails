require 'rails_helper'

RSpec.describe Product, type: :model do

  it "is valid with all fields" do
    category1 = Category.new name: "balloons"
    product = Product.new(
      name: "Black Bookshelf",
      category: category1,
      price: 1,
      quantity: 1
    )
    expect(product.save).to eql true
  end

  it "is not valid without a product name" do
    category1 = Category.new name: "balloons"
    product = Product.new(
      name: nil,
      category: category1,
      price: 1,
      quantity: 1
    )
    product.save
    expect(product.errors.full_messages).to include "Name can't be blank"
  end

  it "is not valid without a category name" do
    category1 = Category.new name: "balloons"
    product = Product.new(
      name: "Black Bookshelf",
      category: nil,
      price: 1,
      quantity: 1
    )
    product.save
    expect(product.errors.full_messages).to include "Category can't be blank"
  end

  it "is not valid without a price" do
    category1 = Category.new name: "balloons"
    product = Product.new(
      name: "Black Bookshelf",
      category: category1,
      price: nil,
      quantity: 1
    )
    product.save
    expect(product.errors.full_messages).to include "Price can't be blank"
  end

  it "is not valid without a quantity" do
    category1 = Category.new name: "balloons"
    product = Product.new(
      name: "Black Bookshelf",
      category: category1,
      price: 1,
      quantity: nil
    )
    expect(product).to_not be_valid
    expect(product.errors.full_messages).to include "Quantity can't be blank"
  end

end



#vaildates :name, presence: true;
#vaildates :price, presence: true;
#vaildates :quantity, presence: true;
#vaildates :category, presence: true;