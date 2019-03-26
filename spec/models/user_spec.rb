require 'rails_helper'

RSpec.describe User, type: :model do
  
  it "is valid with all fields"  do
    user = User.new(
    first_name: "pete",
    last_name: "peters",
    email: "pp@mail.com",
    password: "12345",
    password_confirmation: "12345"
    )
    expect(user.save).to eql true
  end

  it "is not valid when passwords do not match"  do
    user = User.new(
    first_name: "pete",
    last_name: "peters",
    email: "pp@mail.com",
    password: "12345",
    password_confirmation: "56768"
    )
    user.save
    expect(user.errors.full_messages).to include "Password confirmation doesn't match Password"
  end

  it "is not valid when passwords do not match"  do
    user = User.new(
    first_name: "pete",
    last_name: "peters",
    email: "pp@mail.com",
    password: "12345",
    password_confirmation: "56768"
    )
    user.save
    expect(user.errors.full_messages).to include "Password confirmation doesn't match Password"
  end

  it "is not valid when email is not unique"  do
    user1 = User.new(
      first_name: "pete",
      last_name: "peters",
      email: "pp@mail.com",
      password: "12345",
      password_confirmation: "12345"
    )
    user2 = User.new(
    first_name: "jan",
    last_name: "junes",
    email: "pp@mail.com",
    password: "12345",
    password_confirmation: "12345"
    )
    user1.save
    user2.save
    expect(user2.errors.full_messages).to include "Email has already been taken"
  end

  it "is not valid when email is not unique"  do
    user1 = User.new(
      first_name: "pete",
      last_name: "peters",
      email: "pp@mail.com",
      password: "abcde",
      password_confirmation: "12345"
    )
    user2 = User.new(
    first_name: "jan",
    last_name: "junes",
    email: "pp@mail.com",
    password: "ABCDE",
    password_confirmation: "12345"
    )
    user1.save
    user2.save
    expect(user2.errors.full_messages).to include "Email has already been taken"
  end

  it "is not valid when first name is not present"  do
      user = User.new(
        first_name: nil,
        last_name: "peters",
        email: "pp@mail.com",
        password: "12345",
        password_confirmation: "12345"
      )
      user.save
      expect(user.errors.full_messages).to include "First name can't be blank"
  end

  it "is not valid when last name is not present"  do
    user = User.new(
      first_name: "pete",
      last_name: nil,
      email: "pp@mail.com",
      password: "12345",
      password_confirmation: "12345"
    )
    user.save
    expect(user.errors.full_messages).to include "Last name can't be blank"
  end

  it "is not valid when email is not present"  do
    user = User.new(
      first_name: "pete",
      last_name: "peters",
      email: nil,
      password: "12345",
      password_confirmation: "12345"
    )
    user.save
    expect(user.errors.full_messages).to include "Email can't be blank"
  end

  it "is not valid when password is less than 4 charcters"  do
    user = User.new(
      first_name: "pete",
      last_name: "peters",
      email: nil,
      password: "123",
      password_confirmation: "123"
    )
    user.save
    expect(user.errors.full_messages).to include "Password is too short (minimum is 4 characters)"
  end

  describe '.authenticate_with_credentials' do
    before(:each) do
      @user = User.new({
        first_name: "pete",
        last_name: "peters",
        email: "pp@mail.com",
        password: "abcde",
        password_confirmation: "abcde"
      })
      @user.save!
    end

    after(:each) do
      @user.destroy
      remove_instance_variable(:@user)
    end

    it "is valid when guser gives the correct credentials" do
      user = User.authenticate_with_credentials(@user.email, 'testtest')
      expect(user).to eq(@user)
    end

    it "is not vaild when user gives the incorrect credentials" do
      user = User.authenticate_with_credentials(@user.email, 'no match')
      expect(user).to be_nil
    end

    it "is not vaild when missing credentials" do
      user = User.authenticate_with_credentials(nil, nil)
      expect(user).to be_nil
    end

    it "is vaild with a padded emails" do
      user = User.authenticate_with_credentials('    ' + @user.email, 'testtest')
      expect(user).to eq(@user)
    end

    it " is vaild with incorrect case email" do
      user = User.authenticate_with_credentials(@user.email.upcase, 'testtest')
      expect(user).to eq(@user)
    end
  end
end