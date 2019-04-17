require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature do
  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "clicking AddToCart increments counter in cart" do
    # ACT
    visit root_path
    cart_link = find(".navbar a[href='#{cart_path}']")
    expect(cart_link).to have_content("My Cart (0)")
    within('.products .product:last-child') { click_link('Add') }
    
    #VERIFY
    cart_link = find(".navbar a[href='#{cart_path}']")
    expect(cart_link).to have_content("My Cart (1)")

    end
end
