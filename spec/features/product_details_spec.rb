require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature, js: true, do

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

  scenario "navigates from products to product details when link clicked" do
    # ACT
    visit root_path
    

    # DEBUG
    save_screenshot
    
    #VERIFY
    within('.products .product:last-child') { click_on 'Details »' }
    expect(current_url).to eq(product_url(:id => 1))

    end

  

end
